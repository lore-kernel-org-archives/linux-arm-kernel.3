Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1930BC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vHpCxyeMRYVnMwDC3ADr8rpJ4+/Em1q289h9ZGECtCs=; b=aqg8RLYYEhJJZMLLIu9b3Xhp2U
	/So4tckqTRUiMZPi8lFNVx7vmBDt8e+DT9GtOKhyi5JWFvJ5QYqfY+3b0OXjMfEZPiw5/mR91Ap6m
	TTewyDOet8ukvYczFYBmHT4XsBsEAEKLRvfWvTKwZFntkgLnDFxcW4F1qS0kefN674zX+UMuufbp7
	gHUXaGuKgHewgQJgkNDjPLo/ZDx5K823xEaDJn9zmLPEiST3uchAYm+DU0Ri7O+B6MbclC6p9ZZcT
	Vxb5bLGbZpQpuw/cVovMvDGEPquQrOAEHJN5WoQQ7HRH1Xy9QW2NLt7v7tlKmi7pqqi3RUCOt7zKk
	IiPQ3MLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJMV-00000002yCK-0N5j;
	Fri, 09 May 2025 08:45:43 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIWP-00000002pCd-36Q9;
	Fri, 09 May 2025 07:51:55 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 28A09C405A46;
	Fri,  9 May 2025 09:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 28A09C405A46
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Dafna Hirschfeld <dafna@fastmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jacopo
 Mondi <jacopo.mondi@ideasonboard.com>, Paul Elder
 <paul.elder@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] RKISP1: correct histogram window size
Date: Fri, 09 May 2025 09:51:46 +0200
Message-ID: <m3tt5u9q7h.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_005153_932269_CD998EC0 
X-CRM114-Status: UNSURE (   5.47  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Without the patch (i.MX8MP, all-white RGGB-12 full HD input from
the sensor, YUV NV12 output from ISP, full range, histogram Y mode).
HIST_STEPSIZE =3D 3 (lowest permitted):

isp_hist_h_size: 383 (=3D 1920 / 5 - 1)
isp_hist_v_size: 215 (=3D 1080 / 5 - 1)
histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 229401

Apparently the histogram is missing the last column (3-pixel wide,
though only single pixels count) and the last (same idea) row
of the input image: 1917 * 1077 / 3 / 3 =3D 229401

with the patch applied:
isp_hist_h_size: 384 (=3D 1920 / 5)
isp_hist_v_size: 216 (=3D 1080 / 5)
histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 230400

1920 * 1080 / 3 / 3 =3D 230400

Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drive=
rs/media/platform/rockchip/rkisp1/rkisp1-params.c
index b28f4140c8a3..ca9b3e711e5f 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -819,8 +819,8 @@ static void rkisp1_hst_config_v10(struct rkisp1_params =
*params,
 		     arg->meas_window.v_offs);
=20
 	block_hsize =3D arg->meas_window.h_size /
-		      RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10 - 1;
-	block_vsize =3D arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW_NUM_V10=
 - 1;
+		      RKISP1_CIF_ISP_HIST_COLUMN_NUM_V10;
+	block_vsize =3D arg->meas_window.v_size / RKISP1_CIF_ISP_HIST_ROW_NUM_V10;
=20
 	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_HIST_H_SIZE_V10,
 		     block_hsize);

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa


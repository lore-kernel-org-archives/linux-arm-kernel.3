Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19C4D3B7F7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 09:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOIUL1oX06CtFDeyRoBomdqo4Cl7y0kPfh9Sbeb7xtM=; b=TOfCj18qMX/tRlDZIdz3Qeexu7
	BtuwqHBsWWpheXDYftFc9f+0E1fPMK7yUdjYVTEKcu2vIRMwNfrBlTdIvHCUAaAbsfOgqrSEnni+i
	sYC93h3+1e/aJw+pJAAUlrI4M2SvyH73yTou0/jAcREthc8QQ6UbMYQcEZsBVLgM0tvWhdkPLX8zZ
	9Fk9nf+WghKLxifkwL4SGlyOfP4DWF6HczZddmFptE2hxT4KH3O29sGoJie6cwHoTz103K2Li5dce
	KNBgRoTOmG04rq482eHZTYaXKoyNenGyksI2CkwHzYtHiwGjjnyzoud7WUOKOGyg1lrjX6sPTehAT
	auvAMSIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVRJ-00000007ZPI-3gSq;
	Mon, 25 Nov 2024 09:31:29 +0000
Received: from mo-csw1800.securemx.jp ([210.130.202.134] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVNZ-00000007Yj7-38EA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:27:40 +0000
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key2.smx;t=
	1732526834;x=1733736434;bh=J0mvAuwvV6YMmHv11HyZs8PDqoQuS1HOBJbGPaB7TSA=;b=PZe
	HxaCbq2+aeXygF6D8+UCUIvv4geY7nKngbrTSugMHeKlonV68X246PBwATrTKI63UidHGsw0DjmO3
	Fg41hpsIvxUik02rwer7UiIR6MmCEARv5WtDbAdbkJbcV/TbZEY1f6/dTtrhs2gM3pjq4XAsHImuJ
	ODhgNYcX1mXxJkEcwT8WlDykmlo6u5xQZdHq85ZklRGNuuf5HBdESMqU5tIq3c1W6mE08i5fd9GjM
	EX+ckdbynk1htQAqI5Q8RB4eVuSWM2qQAlul5wee/yxrXO239O0ut96gZ+Jqfco3K4Tf72aYejqvX
	jhJKrBr+s+JiH2U7I1mg6y1Yp3VD/bA==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 4AP9RDcG023988; Mon, 25 Nov 2024 18:27:14 +0900
X-Iguazu-Qid: 2yAa5GSxJ6lY5CrZGV
X-Iguazu-QSIG: v=2; s=0; t=1732526833; q=2yAa5GSxJ6lY5CrZGV; m=zfO2799Q2c8IvxS+F5k0v2J48l4RBfpfn/qT1hIeQLg=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1802) id 4AP9RCIP4129100
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 18:27:12 +0900
X-SA-MID: 35004178
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v12 3/8] media: uapi: add visconti viif meta buffer format
Date: Mon, 25 Nov 2024 18:21:41 +0900
X-TSB-HOP2: ON
Message-Id: <20241125092146.1561901-4-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_012737_987287_D90366BE 
X-CRM114-Status: GOOD (  10.11  )
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

Adds the Toshiba Visconti VIIF specific metadata format

- V4L2_META_FMT_VISCONTI_VIIF_PARAMS for ISP parameters
- V4L2_META_FMT_VISCONTI_VIIF_STATS for ISP statistics

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
Changelog v10:
- add entry for V4L2_META_FMT_VISCONTI_VIIF_PARAMS
- add entry for V4L2_META_FMT_VISCONTI_VIIF_STATS

Changelog v11:
- no change

Changelog v12:
- add description for meta formats at v4l2-ioctl.c

 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0304daa8471d..f7facb63b8ea 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1470,6 +1470,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RPI_BE_CFG:	descr = "RPi PiSP BE Config format"; break;
 	case V4L2_META_FMT_RPI_FE_CFG:  descr = "RPi PiSP FE Config format"; break;
 	case V4L2_META_FMT_RPI_FE_STATS: descr = "RPi PiSP FE Statistics format"; break;
+	case V4L2_META_FMT_VISCONTI_VIIF_PARAMS: descr = "Visconti ISP Parameters"; break;
+	case V4L2_META_FMT_VISCONTI_VIIF_STATS: descr = "Visconti ISP Statistics"; break;
 	case V4L2_META_FMT_GENERIC_8:	descr = "8-bit Generic Metadata"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_10:	descr = "8-bit Generic Meta, 10b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_12:	descr = "8-bit Generic Meta, 12b CSI-2"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index a5418759e2ba..9e1f66fdf038 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -863,6 +863,10 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPI_FE_CFG	v4l2_fourcc('R', 'P', 'F', 'C') /* PiSP FE configuration */
 #define V4L2_META_FMT_RPI_FE_STATS	v4l2_fourcc('R', 'P', 'F', 'S') /* PiSP FE stats */
 
+/* Vendor specific - used for Visconti VIIF sub-system */
+#define V4L2_META_FMT_VISCONTI_VIIF_PARAMS	v4l2_fourcc('V', 'I', 'F', 'P') /* ISP Params */
+#define V4L2_META_FMT_VISCONTI_VIIF_STATS	v4l2_fourcc('V', 'I', 'F', 'S') /* ISP Stats */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
-- 
2.25.1




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EAFEC01AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=suw9KHLI1LNKkl/PCLrf2qkeUAqtRJBNl4/N/e6MHDw=; b=bBQyHAO0i34A7chYOfyAtROkOp
	+eiwMVAPbDVVvE67jC8XYBmGjQtZGecRSDnKS+ldouI+ghxvaP8lZUtOdCIzZ19BbrSg5bEaGerqq
	XI057ecKMvhZHBUrzwXTUJRXhU8KwDOHUjn3CHLxNbvRlXnH3fAAX0KNs385dOAgzpUgUkpi9rdGK
	1uCBfRYqWk8bRWrb+fvQNcj/bzoa6BBHgjMjqsZxEpAK4ohqx2+qwn0KJFy+M07ds/ofa1SDY/VF+
	Iq/hV1CnsfXCEkB7bSlY5KMtjDVlQ9OMldc46JYkn154JegEoTk0HK9jZdhbOaOvGrGNEdEy9tjrN
	crtBU/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bIp-0000000GLDX-3PRX;
	Mon, 23 Mar 2026 09:10:27 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bIm-0000000GLCZ-3ggt;
	Mon, 23 Mar 2026 09:10:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774257016; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=fCnQxOjBHWAvciIhvDWKGSu1LEvxeGBq1dtQMwfQ/6WAAJnAx3Yp4cEn/ZabU9x/sM
    GIgqdDNxbQutsjV8oO8lPOLn0DpOb3Bkoq8I0uKtoF4cqWGt+gTdB6X0ByylvHnf8gUR
    JMKimUSb+RNCcx2n245u3T+748iW+y08/SRCUhsrhZuz7IWewgetlkXiKpxFeF9OMaWA
    804UyV/Q/Q9RAubQsnrfP2ieNJ40fkzT5ZJXl/ctRCmY30+9x5QrfVBfPbAKgeoc/nuo
    dQvcgEg8VW1iU4gK4sOFBovJLylMa5bx9O1TpWqp/V4s5NLxvAvR/ejnFPQbpcDJeibg
    mPoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1774257016;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=suw9KHLI1LNKkl/PCLrf2qkeUAqtRJBNl4/N/e6MHDw=;
    b=j44P6oh9KjaapEvWeWAxinrm23dGpzGc6zQgz8zReYtOa8RQO1OZtijvbstav8i6TH
    y+e9aUAZguwnx0WsGDuoMcYVUX5ylEtlgqztFbRc8KybT5ARjQynxC4UA7LeXPElPkqr
    wC1AVGXoNo/vsaKHiJE9i20B3Kr/VSvUMtPkZT3YFWr79PoMgfshTB8yJamJoNXAdAo4
    Vks/GHstO1/+Ff+kWLQUyNUbqK03RupBrRmd+PHiMZbqvG03lpDg71c2dg869GrHeBwB
    7ILalUn4LJCoSg7K30giTEp1xd4ooKQGr/A3zDJpaxAxSuik5QrqD3SdHKefIB1xqfub
    PxCQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1774257016;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=suw9KHLI1LNKkl/PCLrf2qkeUAqtRJBNl4/N/e6MHDw=;
    b=oB5MUOcwnL8wCWZIvUbSF+n2tSmvY2PVB1F2iP1KO29zhSuG8WjCJd7fd9BCHBLaoO
    hCZji4UZWVbHd/cymJEyO1S+ozjz244YJBfyKb9vafioRhTGzelXhX4OzKC6kK5nhtL4
    YQR79nLITuX5GloZVPJoO/UpMz3kMEQO92qhPnTcL6pc37pfKMniHYxAQAZfa0t7YL1Z
    S1L3kuaFutU7wdHOboPeeVPCX/vhOxSEJR9ndUkN4paxKvvTF6X72S4NxJju1E+/ZgG5
    Z9NH3rqjY80KOT4BKWf7AYDRjw3oVY2qlgM2m1rS0eSuQi0Z8yn0yYbBvO6roGjoWV3Z
    Vs2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1774257016;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=suw9KHLI1LNKkl/PCLrf2qkeUAqtRJBNl4/N/e6MHDw=;
    b=OxctGTOoYRuBaiR748PWHh5Zf8TwSpWRVyedcUgy/m2eZ9JYyuKBf0kvDe4ia1Uls5
    cUNnrJp25Kfa9ukmmCBQ==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V0DBslXBtZUxPOub3IZqk"
Received: from [10.176.235.211]
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id z7934522N9ADQJ7
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 23 Mar 2026 10:10:13 +0100 (CET)
Message-ID: <d74ef14d2376d6b4ca819eccb4570120f658caeb.camel@iokpp.de>
Subject: Re: [PATCH v4 01/12] scsi: ufs: core: Introduce a new ufshcd vops
 negotiate_pwr_mode()
From: Bean Huo <beanhuo@iokpp.de>
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 bvanassche@acm.org,  beanhuo@micron.com, peter.wang@mediatek.com,
 martin.petersen@oracle.com,  mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Sai Krishna
 Potthuri <sai.krishna.potthuri@amd.com>, Ajay Neeli <ajay.neeli@amd.com>,
 Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Chaotian Jing <chaotian.jing@mediatek.com>, Stanley Jhu
 <chu.stanley@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  "Bao D. Nguyen"
 <quic_nguyenb@quicinc.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Archana Patni <archana.patni@intel.com>, open list
 <linux-kernel@vger.kernel.org>, "open list:UNIVERSAL FLASH STORAGE HOST
 CONTROLLER DRIVER..." <linux-samsung-soc@vger.kernel.org>, "moderated
 list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:UNIVERSAL FLASH
 STORAGE HOST CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>,
 "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-arm-msm@vger.kernel.org>
Date: Mon, 23 Mar 2026 10:10:12 +0100
In-Reply-To: <20260321031021.1722459-2-can.guo@oss.qualcomm.com>
References: <20260321031021.1722459-1-can.guo@oss.qualcomm.com>
	 <20260321031021.1722459-2-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_021025_250250_702D6C78 
X-CRM114-Status: GOOD (  10.31  )
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

On Fri, 2026-03-20 at 20:10 -0700, Can Guo wrote:
> Most vendor specific implemenations of vops pwr_change_notify(PRE_CHANGE)
> are fulfilling two things at once:
> - Vendor specific target power mode negotiation
> - Vendor specific power mode change preparation
>=20
> When TX Equalization is added into consideration, before power mode chang=
e
> to a target power mode, TX Equalization Training (EQTR) needs be done for
> that target power mode. In addition, UFSHCI spec requires to start TX EQT=
R
> from HS-G1 (the most reliable High Speed Gear).
>=20
> Adding TX EQTR before pwr_change_notify(PRE_CHANGE) is not applicable
> because we don't know the negotiated power mode yet.
>=20
> Adding TX EQTR post pwr_change_notify(PRE_CHANGE) is inappropriate
> because pwr_change_notify(PRE_CHANGE) has finished preparation for a powe=
r
> mode change to negotiated power mode, yet we are changing power mode to
> HS-G1 for TX EQTR.
>=20
> Add a new vops negotiate_pwr_mode() so that vendor specific power mode
> negotiation can be fulfilled in its vendor specific implementations.
> Later on, TX EQTR can be added post vops negotiate_pwr_mode() and before
> vops pwr_change_notify(PRE_CHANGE).
>=20
> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>

Looks good to me. Let=E2=80=99s move forward!

Reviewed-by: Bean Huo <beanhuo@micron.com>


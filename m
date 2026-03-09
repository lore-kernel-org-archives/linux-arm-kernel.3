Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E99EFCD77
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NlPBU6mm/vR3l3IynQJyTnSVRzr3DXJWAgerFRXKwLY=; b=EGWoHz1RAG3V0qmp0d5Z28FXTx
	ycK3JAlJGuXJo+xr3fsw2YlyRTeGANOtB3v0xCRTwKuw45q9qLnDeRH14EJNB08On+synYt0A/pGu
	JfvdlEjvpoY/36X0QZhO/0kiYGEutS5vEmG5F3YlT8BziykwSWYrWmQLKOgrSpmMvuVCoVCLIZ8ke
	A25Zlucw7uE8SadttsEmdp4aIuGbWSu15sefZAZWvQC7+yXAC9PbuoCSiJcL75ac7D6Vd8/HS100/
	TfdK4le6asQG1LtbPA93zBwAFL9aK0NbAkwL6ww9tb+oxOhrmUuNBpSwnlejf9EI7tGMyY8mT5F6P
	5AA5kvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXTn-000000072mb-0ndi;
	Mon, 09 Mar 2026 10:04:51 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXTj-000000072lz-48Tu;
	Mon, 09 Mar 2026 10:04:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773050663; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WPKrdsecXgvpHVw3d3nA7UKT5PHJNT4CVQC1wG3jkoTNIrWS0kkfHp25A9EAsGTtUg3my3EIBZ9cAYhDH/7GZ87SYfPkLX9nWSV0hO7AsCEktYkMz08X1zMu77OuRIbRaX/3r1+PpRfXlG66IkdIhRZvRncGQ7Z9ascvWR05+D4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773050663; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NlPBU6mm/vR3l3IynQJyTnSVRzr3DXJWAgerFRXKwLY=; 
	b=ITht2xuBtAY+LyVbcl9bvvuPCXhHUIobCtTsZc5aFz2E4VdopHHB54s6J/T26V2aPee8kKx0Y8T/PCGRwsXTB5HQzkXEBUtiVmomJr13U5450kH9p11rX8gGW9jmq3SEV1GAmDKZIyxElT/VTgzgGJfOPj8GKyWMbhV1gitWc0M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773050663;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=NlPBU6mm/vR3l3IynQJyTnSVRzr3DXJWAgerFRXKwLY=;
	b=FfyXGNfa7BdEYR+/X2BWXaCeOR1xLNi6bU3NnS6twJjCEsBQSvH3U0tRJJlNxVin
	EthZxVdVb5u3865e3MDpOBj6BEMpriUN0Oqy+EMI529/FmafrTz8JcGKAzykVNai9Go
	VPM5cR5IPh4kSsAqFib03nKGO6VeWMO4YndPgj5I=
Received: by mx.zohomail.com with SMTPS id 1773050662683221.52211658341253;
	Mon, 9 Mar 2026 03:04:22 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Rob Herring <robh@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, kernel@collabora.com,
 linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 03/23] dt-bindings: ufs: mediatek,ufs: Add mt8196 variant
Date: Mon, 09 Mar 2026 11:04:14 +0100
Message-ID: <5973984.DvuYhMxLoT@workhorse>
In-Reply-To: <yq14imrwp3z.fsf@ca-mkp.ca.oracle.com>
References: <20260306-mt8196-ufs-v9-0-55b073f7a830@collabora.com>
 <4089450.ElGaqSPkdT@workhorse> <yq14imrwp3z.fsf@ca-mkp.ca.oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_030448_079243_CE5D8CDD 
X-CRM114-Status: GOOD (  16.72  )
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

On Saturday, 7 March 2026 19:01:17 Central European Standard Time Martin K. Petersen wrote:
> 
> Nicolas,
> 
> >> "ufs" is redundant as all the clocks are for UFS. Same comment on prior 
> >> patch.
> >
> > Is this naming a big enough concern to block this series with two
> > explicit acks on this patch that fixes a wholly broken and useless
> > binding?
> 
> It is if it comes from one of the DT maintainers.
> 
> > I am trying to put out this dumpster fire of a downstream turd that
> > made its way into mainline as the review process has been completely
> > subverted, and is only getting worse with each passing month
> 
> This has to stop. Please read Documentation/process/code-of-conduct.rst.
> 
> 

I apologise for my tone, it's my frustration getting the better of me.

I'll be handing off this series to someone else, so you won't have to
deal with me anymore.

I do ask however that you don't apply patches from MediaTek blindly;
if there's code to read an OF property, and that OF property is not
in the binding, then the patch should be rejected, even if there's an
Ack from the MediaTek maintainer.




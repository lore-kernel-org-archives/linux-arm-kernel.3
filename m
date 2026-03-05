Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A925F30924
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V94vJUMAUqkp8XTyxdwOF9Zhm8eyGffjICa34MBPhnU=; b=zv01IMjMwPXdqLyG10Xk+2Foy3
	rFWxAqZ8BgKOX8/9slUaRNMWLWtM7l4m9Yxhk46USxTLKrC1n6OcvmE5eq5A2/+kDxey1ZEdWlwD+
	gh82kD2VEf1D+WVUVzTP6+6GrpGuAYGrpJ74erZT0xRdKmJVB/uPFbDxLC1nNsMR+MkHEjXjdxUqy
	L46QZi4aYw8iKrVRrnHZUSq7crwRZbXhXRmNfCNso5WenFo0+Fov+j0Q4Zk0Af1d+F3x+bz+XnSqp
	p+uWabf8mDbZoDSE58ffJmRP23mwZS6mQd+xdclPnEqoa4Nnlo0K2Dave7HNk9VQP1qA9Z8tzLAbj
	0VrsyX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Sq-00000001ToY-2m0M;
	Thu, 05 Mar 2026 09:57:52 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Sn-00000001To6-1XNZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:57:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vy5SO-0005fW-Ni; Thu, 05 Mar 2026 10:57:24 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vy5SM-003rSo-2D;
	Thu, 05 Mar 2026 10:57:24 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vy5SN-00000002FW3-3jOJ;
	Thu, 05 Mar 2026 10:57:23 +0100
Date: Thu, 5 Mar 2026 10:57:23 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ming.qian@oss.nxp.com, linux-media@vger.kernel.org, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca, benjamin.gaignard@collabora.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org, ulf.hansson@linaro.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, Frank.li@nxp.com, 
	peng.fan@nxp.com, eagle.zhou@nxp.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: verisilicon: Fix kernel panic due to __initconst
 misuse
Message-ID: <ayefolxtgwfmvs5h5ln7u4hdope4rdthvpiacdbfbnxe33lgzb@vts2vnib3t7w>
References: <20260305080354.639-1-ming.qian@oss.nxp.com>
 <j4h65w6rwsd227gooa437qfp43z3vtiyaegehbe5md3f22anae@lprbmtart3km>
 <68ef934f-baa0-4bf6-93d8-834bbc441e66@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68ef934f-baa0-4bf6-93d8-834bbc441e66@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_015749_409084_DB65BEB8 
X-CRM114-Status: GOOD (  25.87  )
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

On 26-03-05, Krzysztof Kozlowski wrote:
> On 05/03/2026 10:01, Marco Felsch wrote:
> > Hi Ming,
> > 
> > On 26-03-05, ming.qian@oss.nxp.com wrote:
> >> From: Ming Qian <ming.qian@oss.nxp.com>
> >>
> >> Fix a kernel panic when probing the driver as a module:
> >>
> >>   Unable to handle kernel paging request at virtual address
> >>   ffffd9c18eb05000
> >>   of_find_matching_node_and_match+0x5c/0x1a0
> >>   hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> >>
> >> The imx8mq_vpu_shared_resources array is referenced by variant
> >> structures through their shared_devices field. When built as a
> >> module, __initconst causes this data to be freed after module
> >> init, but it's later accessed during probe, causing a page fault.
> >>
> >> Use __initconst_or_module to keep the data available when built
> >> as a module while still allowing it to be freed when built-in.
> > 
> > would be nice if I get at least some credit for pointing to the correct
> > fix ;)
> > 
> >> Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
> >> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > 
> > However, patch looks fine:
> > 
> > Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> Patch is not correct. This is being referenced from other data where
> nothing is __init. Section mismatch might not point it, but I don't
> think the code is readable and actually correct.
> 
> You can exercise it by rebinding device when built-in.

That's correct, I didn't consider the manual unbind for the built-in
case in which you will trigger the issue again! Dropping the annotation
is the correct fix, thanks!

Regards,
  Marco


> 
> Best regards,
> Krzysztof
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |


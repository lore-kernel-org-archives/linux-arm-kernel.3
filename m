Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BA4CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 12:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcZDAYqZuZvTd/H5R6a61erP18H6V558gIpcykPUuzU=; b=DVW7pODADFve8WIYQEEcd6vCwE
	JsFzv925MtYPexyOKI6L7vKVjjuik4uoGZP8/t6vktipdw+DEVIVcFjvlUQ6MvT50i510iF3W/Qlm
	vGt/BoEl4a70Nkf4jDOASKE2wqkTFoh64y9OohYggjNTwk4Gdcgm4uhSd0yqqi2EsN9uK5acc/jGz
	LSpd2aJL5RbMaskuuRc1c8idpFOoLO5cINdNXwB+lC4Lo0qMfPQNIrGEBXUISGqyTcafADue0zzX1
	fv8z9Ez5vZs9ZCwfKDbcigiE+qu3hdcSeL2QIDdnUktK7DSH2WcF+Qd1um5vy37buqa0GMRyVRDfY
	0rkuHqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLh56-00000008wtG-23qf;
	Sat, 09 May 2026 12:46:56 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLh52-00000008wry-1KxA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 12:46:55 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4E62B1F963;
	Sat,  9 May 2026 14:46:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1778330805;
	bh=vcZDAYqZuZvTd/H5R6a61erP18H6V558gIpcykPUuzU=;
	h=Received:Received:From:To:Subject;
	b=einSO+OoEJhoKr6r94Hm64J+0cWCC0G6elT2VMo/9g7jVQ5YzFuiycxugg/uGTNq5
	 7hNRXh98UZKOEr+aJ0jcApyVjnAHrZ2SOYhDVLvrzw0GUuEuLOzxTA0ISQEbaAlC97
	 KQ80wimnI088XkcvUdisYVQ6oh0cTfxfiqysnjCeAVf8yLUMcQIOQgxlPo+o9ylvEQ
	 KVQgb5EsSRn7QJKQm74pl50F3yrLLo0itdU+ouetM1Ev86EjCWBz9s38GwucCA/Yeo
	 EUhtHjtZODdAnXQK2JiNK51jZSAT1I2H0FywgzPPeUSAtAZ7KKYqkTUnICKrrZy68O
	 r+tcbIXRNdu3A==
Received: from livingston (unknown [192.168.42.11])
	by gaggiata.pivistrello.it (Postfix) with ESMTP id 046787F9D1;
	Sat, 09 May 2026 14:46:45 +0200 (CEST)
Received: from pivi by livingston with local (Exim 4.98.2)
	(envelope-from <francesco@dolcini.it>)
	id 1wLh4u-000000002l9-3poB;
	Sat, 09 May 2026 14:46:44 +0200
Date: Sat, 9 May 2026 14:46:44 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Franz Schnyder <fra.schnyder@gmail.com>, Xu Yang <xu.yang_2@nxp.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com,
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <af8stIGhzVMfhyIQ@livingston.pivistrello.it>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
 <20260108081433.2119328-3-xu.yang_2@nxp.com>
 <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
 <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>
 <hsyy2owzbt7tsljktlrz5g4bnrnecznvcyy6zxt7gfyxb4xvgi@ysko6xe6h2zm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hsyy2owzbt7tsljktlrz5g4bnrnecznvcyy6zxt7gfyxb4xvgi@ysko6xe6h2zm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_054653_405299_17307807 
X-CRM114-Status: GOOD (  23.33  )
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

On Fri, May 08, 2026 at 06:04:49PM +0200, Franz Schnyder wrote:
> On Fri, May 08, 2026 at 06:54:40PM +0800, Xu Yang wrote:
> > It's strange that link->status is not DL_STATE_DORMANT or DL_STATE_NONE at
> > the time which means the device core may not properly unbind consumer devices
> > or handle something. The patch does a simple thing so the issue may not come
> > from the patch itself.
> > 
> > 1639:	list_for_each_entry_safe_reverse(link, ln, &dev->links.consumers, s_node) {
> > 1640:		WARN_ON(link->status != DL_STATE_DORMANT &&
> > 1641:			link->status != DL_STATE_NONE);
> > 1642:		__device_link_del(&link->kref);
> > 1643:	}
> > 
> > Which kernel and dtb are you using? If it's a downstream repo, how do the USB
> > controller and related DTS nodes look like?
> 
> I was using kernel version 7.1-rc2 and noticed it while working on 
> sending the Aquila iMX95 upstream.
> https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-2-69c8ee1c5413@toradex.com/
> > 
> > Does the issue easily happen? Does dwc3_imx8mp_probe() eventually succeed?
> 
> I did various boot attempts with the commit reverted and couldn't 
> reproduce the issue. With the commit I ran into the issue in about one 
> third of all boot attempts. So most of the time dwc3_imx8mp_prove 
> actually succeeds.

...

> > Yes, if you use the new driver, I think this issue won't happen at all.
> > 
> So once your work is merged in the imx95.dtsi we should be fine.

To me it looks like a regression that should be taken care of.

Maybe not relevant for aquila imx95, where you did reproduce it (the reason is
that aquila imx95 is not in mainline, yet), but from the USB point of view this
board is very similar to other boards using the i.MX95 SoC that are therefore
likely affected.

Francesco



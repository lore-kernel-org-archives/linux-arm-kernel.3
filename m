Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597EDC54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MoKTv+gUm/9yZeD/+so0VapxSVD6JHLChmPeFz93WM=; b=2QogbODf0Zw5svSMS515+Co+o9
	BDd1rvGx+CY6fW9QyHaCKF1HDfMv1YowNF0MFnuS6yQZvcMLqTTPN5292Vrvg8ZMDrmLhcbOrePlS
	PSdi446OafthLdl6o28a7V92y6Y80lOPktGm7f4BNOjp6pJR/xDoJqAOlgAQC5A8yFVC3FQutyD7G
	Gqqwt+CRY4bANl6dwUU5rWnrZANOnvOIbRiui/diQnMtp6uSLFKpwdlZRJ/10k9HF+CYNsYferwoq
	D5HZUKWam6vNKDxyWOZbv6rSxlDvUyJM3Cs2VG6B0cKyh57eplQVEfyyhx0Lv9rc85suLFMyA5BAV
	8KHcAxNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpO0v-0000000ADHy-14G9;
	Thu, 30 Jul 2026 10:29:21 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpO0s-0000000ADHX-2PEG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 10:29:20 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id EDA13EC0484;
	Thu, 30 Jul 2026 06:29:16 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 30 Jul 2026 06:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785407356;
	 x=1785493756; bh=+MoKTv+gUm/9yZeD/+so0VapxSVD6JHLChmPeFz93WM=; b=
	fT7HidSjoJ/EpfsNuNwe2CLt7DhSST9veKDdVKFRAAPdC+zxl3KuKwfY6F6XGWo7
	lunzH8dsOPj5Ezh377EVMbF2fRqthWAwqicWSrUU5E2p96m7zBDwIwyWM/aIYj8J
	xwkTDejZhyaBGNZ9ralqc27AhOxdHnvl3t46OknDUK+6zwOBrzdl5CJZa9QlxuOB
	6E6BnlF2eH8I7Eve1whSWV2czsUV9Yx/iH8DmX+1xYwyl0pS0viIMWdphYjDPItd
	6SspqyWpnQ6jfXKuhPldHY6pKwU/4F0QSAPQEFGO7rFbBkRmMokU0NVakrK1chNj
	nsIx4hZ5kD8bX0OAxV8kEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785407356; x=
	1785493756; bh=+MoKTv+gUm/9yZeD/+so0VapxSVD6JHLChmPeFz93WM=; b=n
	uqxy/+R0Jr4jyOAPS7HMVTXgkPft9oTYiRlij2iThhZq3HqKF39f8j8PRDNd2ZgA
	IajNXLNkT8ycbc5hrlYjIFOpTadfxzH5pCGXYi1hSe4jkh5qAbFpAcyY4CU7Kl34
	g0kVMWWtPAHWC0ayQZxnYhCoXGfaFs+RvNjrtY0bQANbybOb8cHX1rF3VHlXy+Ng
	pkxyXT7xVNwvikNbPjHt91gW7TXUfcbi+MrNwhHt0HXaOn/UwJ07sBvMSfnAE/ig
	rL6uqZZQTFdUrBUomGu3Gppk3TH8uNzRJe212+2nraJPyScua89ZcvNgoa42q4Py
	gG7bch9JowaAPAQnHXL7w==
X-ME-Sender: <xms:eydralgiA9GsFxxyoHPzmaHAkUq3STjgpUhVFS38BWDgvWkabhtG8w>
    <xme:eydrak2D36NfFNvMMi7qZi7BcZMkGl0R8OzRsoHw-FZZzZv1OH9FrnGhG-jf58Hjv
    -R2vpXBMRJkDpK-rEmqCI3yTjeAmjiwaV5knWKlfgaqKrxs2oWWHw>
X-ME-Proxy-Cause: dmFkZTF451LBXYI4j6NEK9hCZOBaU5/6KEaQvCWRqHjTDYA3asyt5srekK924m/jgNEzcd
    DBCwpbHCzUBssNqYXBKMJFEqmpiLsH7zRrbcxGoCFxRPdI+RsUKHuNHa/qEzlb2dodiB9C
    Npd5ZHi4Voz0QXZbBSxiFETt/M6/KAxtjlb46Kj2jV3Ya8DUQGUZPeFrFeZwtwetbRHgmF
    T4vbQ3ZYfqfBZrz1GzJrlaB20ua/dVprjrDCsfRPCfartNb5LLCYIPBAWwBuhq1F2hXG5z
    /rcOnwHkao85KrqB9t4Hc6t2/yJKVnotdAOhUEi/ODTZkzGc8M/IEG51M0Bxp7eqegktSS
    QcLZHCSI8NeeFFCxprPA1EHtfLW+ThT1BMJ79USraBpMdPSUY4ek3lqteZMmtvaw0Dzk3b
    J3pmfx7t7Cbw0YKFlZgndT7nYIDNTkITfjAM8GRC/r1dQhNG/7F2KzbVRzdUBBpy0MHuqn
    GRiL+ol8elyEiAoOpLIhuWks/ccAUgl08fwn3qBCUfIxKkQLH8qJJWZyYn3d/z4c+dKZhe
    4mkxq+OfiLQAO+LPcKArty5CUMT5rSmbfB4NmLkW7t3MNP0BSL28+LsRkSOZVTj+AeGa9a
    EkhrYwO7Uy+G3nyS50P72huHR8b3OYnAhFfqn1LJGElfgFFAhTFVgrC1YnKg
X-ME-Proxy: <xmx:eydrasdbuSR2A2KuSjdJQHRXsNpw6WCeif7BrGE-Tg13YSZ4-QruSQ>
    <xmx:eydrajYlVYnV1qaLrgP_3A2HkslLTrE0-bBg3_UGEAhNgn-DxcrdSA>
    <xmx:eydrag7k4TliYOQwWYYoSWOWURthM_MN-ejq0-uLIK2YnCUQGB74Rg>
    <xmx:eydrahftGJcFx_lW6vl4qXGeIWQfFoz8jywdVI8Pu7Nk7tJS2oV0_g>
    <xmx:fCdrauOd974YnS-3anIrLWrF-bnRn5fFIYf1SUK6EDARgIuWaONJUFFr>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E16A71820082; Thu, 30 Jul 2026 06:29:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AoDbeUyM7k0c
Date: Thu, 30 Jul 2026 12:28:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Frank Li" <Frank.Li@oss.nxp.com>, soc@kernel.org, arm <arm@kernel.org>
Cc: "Frank Li" <Frank.Li@nxp.com>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dbgh9129@gmail.com,
 geoffreyhe2@gmail.com, griffin@kroah.com, lijun01@kylinos.cn,
 "Pengpeng Hou" <pengpeng@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Message-Id: <8723f44e-fb43-49ef-b7eb-64267216f53e@app.fastmail.com>
In-Reply-To: <20260729193402.533533-1-Frank.Li@oss.nxp.com>
References: <20260729193402.533533-1-Frank.Li@oss.nxp.com>
Subject: Re: i.MX SoC Changes for v7.3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_032919_137401_3B65808B 
X-CRM114-Status: GOOD (  13.70  )
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

On Wed, Jul 29, 2026, at 21:33, Frank.Li@oss.nxp.com wrote:
>
> ----------------------------------------------------------------
> i.MX SoC Changes for v7.3
>
> - Fix OF/device_node reference count leaks in imx_src_init(),
>   imx7_src_init(), and the AVIC interrupt controller driver
> - Drop obsolete/unused declarations from `arch/arm/mach-imx/common.h`
> - firmware: imx: scu: Refactor mailbox channel management to use a
>   per-instance handle instead of a global one
> - firmware: imx: sm-misc: Add NULL check for `kmalloc` return value in
>   syslog_show
> - soc: imx9: Add error handling for `devm_kasprintf` return value
>

Hi Frank,

I pulled this and the other two branches you sent yesterday,
the contents all look good. A few minor points:

- The soc@kernel.org and arm@kernel.org addresses both forward
  to soc@lists.linux.dev these days, so just use that one
  directly.

- please split the arch/arm/ code changes from the drivers/*
  branches, since we have separate branches for upstream as well.
  The changes here were fairly small, so I'm not asking you
  to resend them for that here.

- It looks like the automated patchwork bot messages again did
  not work here. The git://git.kernel.org URLs failed to work
  recently and I added a .gitconfig insteadOf rule for it, which
  I think makes the pwbot fail to match the URL and not run
  its maintenance scripts that update patchwork and send the
  email. I've removed the rule again as both now work, but
  you might want to send https:// URLs instead of git://

     Arnd


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFD6CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 15:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOe5phv4TtG2VbUNjJcJ2euqfGkUkvoO3y2L/DnVFD4=; b=1umhjZjAEbUjbZPRgQgNw5skgC
	m9T5hR46ff0eBqyro00SY/JtEutEr52YZfNiQKBG4PzKDsltG1FO1beZx44zNKW1HLrjTJm7v1T9i
	snwsPvs2bAO0XJzNvwMo81dH9YBwawYFsVBbopIh8cTrmVOP4a4uUyW9i1onF21naloHOK8nUI5Cj
	iT+bNv2pNmCvkkwLd8c8j6EWTo1Rl/bH/H8HegiJB5JgLt3xL1gpGY2wyIysKS2mYvmVxS1YEX9/H
	HxiYlYoqtP6ptadMi4BP3afUjBrZ8T+pkNgSUXwLdmkStUo0I/mHIAEbHE7ciMsB3c9Asx8VAIxyp
	mw+Vyl/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCK8L-00000009sO2-354f;
	Fri, 24 Oct 2025 15:55:17 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCK8J-00000009sMx-3rKj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 15:55:17 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761321313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WOe5phv4TtG2VbUNjJcJ2euqfGkUkvoO3y2L/DnVFD4=;
	b=j+0yL9Vya5MvjeCiKkrp5aHA3FrPWG1ymrAS2OUElS9/ZPxiRKgv9nWBpRvoJk02/qriFz
	JJBOZpVxyF0a3pO64whKW2H9a/wLfwoFu0g2qZMA6RNLvDPCmakGlbBwfR1IpVToMBVAMd
	kPa34EsDIkZim5UGwLtCQZGqf/wGnDn0IX0DJHX46AbD1WmjrUy0U5O41F3AUCRnCgdaXq
	ox3/MD0bzdpUQz9ge0XSjmkFOIIfLal3QteHV3Pj5qFNf1IomHD7dUGbzkwgD8Gkm192ud
	OrIDwfQmwpMkcWbk7DeTW+rEvpmGmCz7Pg+F/Q8cfrHgQ4w8LEIkWZGN8WPOuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761321313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WOe5phv4TtG2VbUNjJcJ2euqfGkUkvoO3y2L/DnVFD4=;
	b=Aw/vJYnYahTo2hh0gMiFd9SCwQyMTaciHm/qxtq4yc+wjlxtj9ZsXPrM9pzho3xk8jiBUE
	h16UxEPBK7T/u9Dg==
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, Sascha Bischoff <sascha.bischoff@arm.com>,
 Scott Branden <sbranden@broadcom.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>, Frank Li
 <Frank.Li@nxp.com>, Manivannan Sadhasivam <mani@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Marc Zyngier
 <maz@kernel.org>
Subject: Re: [PATCH v4 0/5] of/irq: Misc msi-parent handling fixes/clean-ups
In-Reply-To: <CAL_JsqL5f4_qQ=YmQcYpaxsUx8vZDkuquK=G3YTw9qC1QibVrg@mail.gmail.com>
References: <20251021124103.198419-1-lpieralisi@kernel.org>
 <20251022140545.GB3390144-robh@kernel.org> <87v7k4ws58.ffs@tglx>
 <CAL_JsqL5f4_qQ=YmQcYpaxsUx8vZDkuquK=G3YTw9qC1QibVrg@mail.gmail.com>
Date: Fri, 24 Oct 2025 17:55:12 +0200
Message-ID: <87sef8wazj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_085516_094145_F4B2DDF7 
X-CRM114-Status: GOOD (  12.48  )
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

On Fri, Oct 24 2025 at 07:43, Rob Herring wrote:
> On Fri, Oct 24, 2025 at 4:44=E2=80=AFAM Thomas Gleixner <tglx@linutronix.=
de> wrote:
>> On Wed, Oct 22 2025 at 09:05, Rob Herring wrote:
>> > On Tue, Oct 21, 2025 at 02:40:58PM +0200, Lorenzo Pieralisi wrote:
>> >> Lorenzo Pieralisi (5):
>> >>   of/irq: Add msi-parent check to of_msi_xlate()
>> >>   of/irq: Fix OF node refcount in of_msi_get_domain()
>> >
>> > I've applied these 2 for 6.18.
>>
>> The rest of this depends on those two.
>>
>> >>   of/irq: Export of_msi_xlate() for module usage
>>
>> Can you pick the three of/irq ones up and put them into a seperate
>> branch based on rc1 so that I can pull that and apply the rest:
>
> Yes. This series is the only thing I have queued for 6.18 fixes so
> far, so I'll add the 3rd patch and Cc you on my PR to Linus.

Thanks!


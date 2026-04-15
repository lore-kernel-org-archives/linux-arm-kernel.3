Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B50BF9D0CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 02:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBV/+MFplyMX182F7OgLwYJLUvM+93jxAF1jhxn3A/M=; b=AvWY+dtUfDDHYtcB6Tk+gDc3OL
	m2bkTloLnH3BEnSIl4LlQsbiLa44CfPJreHCqhr7rXQcTVwC3K3DzsvOOK0iVFKAXiGkzdG6SuL6B
	syjZqaTyAHAHj2YSo85BVj7ab0b6OPnov1mwPaS1r6PJ1QEsR/Zt7jfPBIVm/7dGBrO+r0Nof7skf
	2D86AIt6ClkReXx5bUot/8rZrQVSSes6+9uoKZisr00wpkgWOZsHc+V024G/I1oX2tpg4vKAabXgP
	ZhML3q1rpIQQWN/ALWHssi0fAWjiudZb4qvXe4LIHF7gFVExvptF9LZhVolo1VAE7YjJiCq42fhTA
	zoFBswNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpkK-00000000TQs-1fWT;
	Wed, 15 Apr 2026 02:12:52 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpkH-00000000TQ2-1L2X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 02:12:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso96342645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 19:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776219167; cv=none;
        d=google.com; s=arc-20240605;
        b=BzZTzBw0qaOYGmLKShODTAHUUqS5RYaw3ntCFNNjcLKuxLTI8alKnchdHYXX8DZuYs
         ZfKxPAJ2FQ53iiEnljBUGKkbA+bdN2MKBnUreIlgp77U0Tnz9V/ilzDqZrXcS4ZtQLAq
         grXgbgbar3x6711hbDP9wm3g4drDvVxhDEWd/vBr4zuGUyFBQpO0QMhXehDZW/Qfz1Fr
         G5iZbuNjoNpAzLhTaMql7e+Nk6ocy9BPXOHPuphAzToSKzdHOwpYvajbIqe//cpNAKg2
         wqoqpOAQQQvFN11O/fknNVrYlyc2C677GhyWPalOt7RyuhNWn8cEjSNVuBgwRyDEhb0L
         rLCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aBV/+MFplyMX182F7OgLwYJLUvM+93jxAF1jhxn3A/M=;
        fh=nBEY/atcrxzvu8tp3U/CqatFBZVcloSj5Ft6flMTews=;
        b=ItHJuTAxZAyLOR7k/QuunDasQNKmGU3Z4Iyr9qLnzQlT+uukpjNYxBEWkv5QPG3FRW
         6sXb775+i6E/2eazXa91tVhKLxDPoteZaAX0QhrX4ulnlqNgbLXR1tics4FGKAejY2bG
         BB2xlxMZV61wsETz88I654pHaJ7jCqhUIU+TvWNlo7S5GMIrOHBDp7X1J5U5fJnwohAM
         2OAvEHF1cS9Ox725uCaWbz2n60dBBU/jmXGcimOKvScJrjCKADEzSEUqop0N8NSon2Mt
         jR6jr4jM3CZ9zVqoaIc0auNXd6/8SqfwjtdXFltSAaa4jQfxJcz0xwhDYqGClYNsvx50
         hqLw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776219167; x=1776823967; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBV/+MFplyMX182F7OgLwYJLUvM+93jxAF1jhxn3A/M=;
        b=l3nzEGTqpHmyN89hztGm8L8G1ST1SkaELOjeLVvTshjIUDYfSayagujTzsxDTIQZE5
         XltllwkKKMjTLkOa4LARtRtrzMSyaRacQ+y5GuNDBcVrt7uICXbFstN3TGp7PFIKa/32
         KiFw9kogPAXDLXOuwd/5fvX64oE5h9tH3olbBOMaWnEC2qqVxf2TtuK3RFBRiZ6fxSGM
         2qv2wcPl8BAAo9afvZLCOy+ah/tLH9mOMCPbU8tdH62zlcAOoEwqYAqnGs16pVTYx32v
         LIQ6ym6xLEKa/YuMFMtZdzRh3Kqds7QzCaAIU0UXefQzAQuBuaxebWKSBNllWU1A29Pk
         H2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776219167; x=1776823967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aBV/+MFplyMX182F7OgLwYJLUvM+93jxAF1jhxn3A/M=;
        b=K9Y0eH4p3r/e4NqHfie4YipDCmA3u3GMvkWMeytOuP2fisKBugkeeRkuD5Ygu8DYg4
         RSheLvy44K8krz73VGcnvqEAUYLmbK5/fNtnK73wlbamvPDx+HqxEIko0ABgqqVHVoue
         fK0Ta5FWUDfCFOGrt61BE5eEbze0eqQhOoZIoTlW2VEjxfdXoHId/DHkRoemmcjyh3F2
         CJ/FDt70tMDOkl5pNZ6MeifF5BLOypEqkil071Pr/mmdv7m6r+szE+aya+LlGI3xdVdo
         RvnZoF78nUKDyYnOzGydb299Zq6J234Iy0uRR+ThI+uuWLgjncFijN0kmg1KvZRC75Co
         SGJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rKThJv8LZFomyrwC25+zkDXCMqvR5UG/nfjjL4cNC3tx2yGcIsYOzWJoahXW7CXb8N7/Oa81ExAkmOIOvIciB@lists.infradead.org
X-Gm-Message-State: AOJu0YwNRv9m4MTPpjpcOMPhEL13PKjWcl4t71WeC5eGUUOepFmX5gjd
	n2kNmdb++E8oo5winjPyTNnbKkkA2ClRzije7g71aOpQaDUg5o3HjJXjpZ/TRS83+BtLq2ik27D
	C0WAVq5huETYNDawb02j7VQcMo8mbiYg=
X-Gm-Gg: AeBDieuAQBM/UTDznJIUdmU6ag6P7FWnQiylhNWIn4oIhLa3kli3gmV2Ht10rQuTk7T
	OQoipILIAMsrUolV8ZCnMM2T1vmMBNOi8tEb8wTniC5ktWA1WBDQYRqyusx6/fj1ODmxgRjcOZa
	xW+cCoq8DtPi4CbBL5t+Ky6zXURiBzSrmrA8ItFQp0jRI5uOjFPJGP93sK9SF6r8vMko7aZaYAW
	pu/LEtatuZ8/w0BNUy3suC+OmOHtHqfzmkw6GUlTJN6e27DfLP6FzU5GCk1JZx5EsGXBMF9b/ja
	sGmmdc64nxtQZs0lUwPwhik+r04h
X-Received: by 2002:a05:600c:4f83:b0:488:7ff5:2c67 with SMTP id
 5b1f17b1804b1-488d67f0aa2mr242704755e9.12.1776219166427; Tue, 14 Apr 2026
 19:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <20260413110222.49fc3759@kernel.org> <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
 <CAH5Ym4i7VV53hQGY3AjAUW3B8g_ffgmw69kPhPrk2CmcRbguuQ@mail.gmail.com>
 <ad5LlXzeQ8j14Mjg@shell.armlinux.org.uk> <ad7nsUQvksJF7JFK@shell.armlinux.org.uk>
In-Reply-To: <ad7nsUQvksJF7JFK@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Tue, 14 Apr 2026 19:12:34 -0700
X-Gm-Features: AQROBzCDcuqEllTQUrqo3wn50XlYGqYnBRK7Hkwk8UIZegBM5SM6IflWL3J01U4
Message-ID: <CAH5Ym4jA8w9=UxMT4vKJpnXkuDHtkFtMcg4u2sy_0S+8wgy-9w@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: enable RPS and RBU interrupts
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Linux Network Development Mailing List <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_191249_390866_B3787E5C 
X-CRM114-Status: GOOD (  17.68  )
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

On Tue, Apr 14, 2026 at 6:19=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> Okay, just a quick note to say that nvidia's 5.10.216-tegra kernel
> survives iperf3 -c -R to the imx6.

Hi Russell,

Aw, you beat me to it! I was about to report that 5.10.104-tegra is
unaffected. And my iperf3 server is a multi-GbE amd64 machine.

> Dumping the registers and comparing, and then forcing the RQS and TQS
> values to 0x23 (+1 =3D 36, *256 =3D 9216 bytes) and 0x8f (+1 =3D 144,
> *256 =3D 36864 ytes) respectively seems to solve the problem. Under
> net-next, these both end up being 0xff (+1 =3D 256, *256 =3D 65536 bytes.=
)
> Suspiciously, 36 * 4 =3D 144, and I also see that this kernel programs
> all four of the MTL receive operation mode registers, but only the
> first MTL transmit operation mode register. However, DMA channels 1-3
> aren't initialised.

Wow, great! I wonder if the problem is that the MTL FIFOs are smaller
than that, so when the DMA suffers a momentary hiccup, the FIFOs are
allowed to overflow, putting the hardware in a bad state.

Though I suspect this is only half of the problem: do you still see
RBUs? Everything you've shared so far suggests the DMA failures are
_not_ because the rx ring is drying up. My gut's telling me the DMA
unit is encountering an AXI error, triggering RBU plus some kind of
recovery behavior, and the recovery takes the DMA offline long enough
for the FIFO to overflow (without triggering RPS because the RQS
threshold is unreachable).

It seems that the problem happens less frequently on my test setup
when I boot with iommu.passthrough=3D1 but that could be my imagination.
But if the hardware remains stable with RQS and TQS set correctly, I
don't feel an urgent need to dig deeper. :)

> Looking back at 5.10, I don't see any code that would account for these
> values being programmed for TQS and RQS, it looks like the calculations
> are basically the same as we have today.

Note that Nvidia have their own "nvethernet" driver for their vendor
kernel, which appears to pick the FIFO sizes from hardcoded tables in
its eqos_configure_mtl_queue() [1] function.

Cheers,
Sam

[1] https://github.com/proski/nvethernet/blob/main/nvethernetrm/osi/core/eq=
os_core.c#L263


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEAACD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dO+UhVuzDjOR9Xal9erNoYHD+4hYeE1itAO+Ot7PglQ=; b=SKIL8hpsWxb1NhXi0RbU28bgy/
	7Z7HT1NNhw+TPEpsoFO8AcKg/H+8es3XaviapLCcYoEyQT2ldRJn+WBgQBBKc/Kkgjw37dPXxOO8m
	aoYepYjfnQECvEH25lhS8XG1o+niddr2AJqZ2EoK7nmH9ZDlEsx/44NNflZxehaX/qJGhygbjN9JF
	csUuJiUEKUzC/mxKPbHwuxHsOIy981wLdgvws76H4EplUfSA6cydNp7QMu/hMcKSY1f3/zPx2GH0Y
	KeAveOdOvB05U9gg+r33kXhFpUvp4R8q920FyoT/qI11CX6tFqV5niuAAkX1lhv3AgAIfbHZIjmeq
	E5Aihh8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTQn-000000026PT-286F;
	Fri, 19 Jun 2026 07:14:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTQk-000000026Om-0s2a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:14:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-464192ab2e1so1051198f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781853260; x=1782458060; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dO+UhVuzDjOR9Xal9erNoYHD+4hYeE1itAO+Ot7PglQ=;
        b=UBvUxsExRuQ7ErB0hDYMJDYXvGrEBrme/65lQrM5PKcN3JQ3yHJmBZauJGOYJMC73D
         Z6ZPSgWqawdtQi5jvikYUwkg6juzHpY2Wp+2iBIdmmTCmvPPPJjvOQx6vibSrxKtfG/q
         DwOz/RMQKLLGGAuY96HwpN6+3meMztmszfObQPKBTgf7k1DTeeSyqJQSoZJuPp9dsgXS
         IKiCDP6yYj67CWlPIjIzkXRWUS8Wsw/qIVtvIsxunZlyHFCHn0TIl07SvKHVAEq2wFSQ
         wmSdXbKkpuG0u7mzoz0uglZ/IOlDLnZkVJTizVGIDgxwDeGg9+gGjWEb+QBcmgztDXjU
         eTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781853260; x=1782458060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dO+UhVuzDjOR9Xal9erNoYHD+4hYeE1itAO+Ot7PglQ=;
        b=EWJ1ShheTXiInZTLkwLcqWrzG129RcnzXKbGYrRpQvRf0tFjMzJTaD2CqEfPrY8jbS
         kcGyPoAfWjAjIRrC8TMTyJ2qGvpjkAaFvIc9CXJ17/WnDPdt65SENDAbj8TPNl9HyWIF
         CR4YSJid+rid7/0MlT1bsxzA6TR5kZa3NCkGoY3erJlZXhs84ZtadAO7ao5p4givl/ZM
         bUSsv5v27VcAW2LqpYVq9d+JmaT8jmC9++GOT5EQtxjKXv/7WfYwMpjUw63Im7z7SuxG
         4bDgz6v7fTz7CHmBJNRhR5rwvvixRQbI+whzDzzgb5u1PP3z8vE2LqUsfJS6HUNkQ8xF
         vDQg==
X-Forwarded-Encrypted: i=1; AFNElJ/cU0tpWI4biSS36e0coDqnSYaMelmev2RFLkY28GQVhOY0KGNcjPCHQ0OYpEmDuOwjT7X7zFJqDjxswNqIcMIo@lists.infradead.org
X-Gm-Message-State: AOJu0YxgEn+EaE3bPjgC3GEeDsnSZyRHyp3RzLbe4XuHrII18cFknwh6
	3Jsi+9bRSq4WdSmJZ5EQW7vghAFMrJFTdKSKGx7+4ulxxHxikMzslXNA8sSSuDXdxi8=
X-Gm-Gg: AfdE7cmv9cssQolgs4RtNRNvnN9GJxufbegNJQE/LqS+3dHj2GPHqKrlI3PZPkFgFQi
	zF0AI3//+oYwwc+/z/TZzyTz1zabJCh1sm4TOmVma8Yu9b0yfkGSB17/YvTiPVRf/HtJVvMWmQR
	uMqYK9CNHLSPLRyn7XE2GhbJ8SkVcOfDLV0UKclH1/xrioe4N3vFdv2vzm0vVPU+Ivx/txBaE6c
	eQRauNPYDeXU2E7zTsFxIoN0UrBBN00nbbIY/vAciWVQUWmRajjM128ann/O/G8Bc6o1fjxxrI+
	g98yq+bEfa4VEW5cWIO6x5a1BQZFSH2mFRhkumrFIheBacdN/+XyFGUtrXr486QmnouKDvkW4XL
	0mhPTFMkmVh1iy8G3AOTLwxjhtH6KgDrYa9C1DeXPf3/LvCqqdkzO2XQHX/WBR5gDW25dInOuxo
	vslQaX0Y2OOA==
X-Received: by 2002:a05:600c:8b24:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-4923f439be6mr49271215e9.14.1781853259707;
        Fri, 19 Jun 2026 00:14:19 -0700 (PDT)
Received: from localhost ([195.94.150.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fce9590sm46202215e9.4.2026.06.19.00.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 00:14:19 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 19 Jun 2026 09:17:43 +0200
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, netdev@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Lukasz Raczylo <lukasz@raczylo.com>,
	Steffen Jaeckel <sjaeckel@suse.de>
Subject: Re: [PATCH v2] net: macb: add TX stall timeout callback to recover
 from lost TSTART write
Message-ID: <ajTtF2xy3WS6NfBi@apocalypse>
References: <468f480454a314303bac6a54780b153f689f2267.1781598350.git.andrea.porta@suse.com>
 <DJAKGHKZGUI2.29AHYNFX4LGBJ@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DJAKGHKZGUI2.29AHYNFX4LGBJ@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_001422_253360_FBC81A97 
X-CRM114-Status: GOOD (  16.83  )
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

Hi Theo,

On 17:07 Tue 16 Jun     , Théo Lebrun wrote:
> Hello Andrea,
> 
> On Tue Jun 16, 2026 at 3:23 PM CEST, Andrea della Porta wrote:
> > From: Lukasz Raczylo <lukasz@raczylo.com>
> >
> > The MACB found in the Raspberry Pi RP1 suffers from sporadic stalls on
> > the TX queue.
> > While the exact root cause is not yet fully understood, it is likely
> > related to a hardware issue where a TSTART write to the NCR register
> > is missed, preventing the transmission from being kicked off.
> >
> > Implement a timeout callback to handle TX queue stalls, triggering the
> > existing restart mechanism to recover.
> >
> > Link: https://lore.kernel.org/all/20260514215459.36109-1-lukasz@raczylo.com/
> > Fixes: dc110d1b23564 ("net: cadence: macb: Add support for Raspberry Pi RP1 ethernet controller")
> > Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
> > Co-developed-by: Steffen Jaeckel <sjaeckel@suse.de>
> > Signed-off-by: Steffen Jaeckel <sjaeckel@suse.de>
> > Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> 
> Thanks for this V2.
> 
> Reviewed-by: Théo Lebrun <theo.lebrun@bootlin.com>
> 
> Any news from the Raspberry Pi community about this bug investigation?

Not from my side, unfortunately.

Regards,
Andrea

> 
> Thanks,
> 
> --
> Théo Lebrun, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 


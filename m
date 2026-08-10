Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C329C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kImCXwl4S/l00e8WQ0YV3wOiF3iZg+3YUcCfhwwyF/0=; b=CtczJweIn/04GMH10hK2H5XyRE
	H2/vMdBp+6GY6BcY1eowJWBXG5CYJwBMZp/YqxckOiQp9uWmxt9LPU+Q5qYdpFf+809OB20CFu79O
	Q15GnHlU8Q4GocrhCutAqEjWa2IR5Gn2MmkoFmuT3S4CN4qoxgxmvlg2Icrx0ISoG6gb69zkCZiaC
	8pY25zyTPozM5wkyF0rYpMRWUlF2zVNU9ZXsscSc3yvE6rQh7m9fCERPofVayGKDtEHmDRAsCu1R3
	b+nDxnyaRM1Zfu/kQIpGZeXYpLMUw8DAQElUjIT5ArOgrK4Y8q1BrZQUofPhBzlNW7d5ny3nd31GA
	GHm2l1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUhr-0000000CdAR-3w2B;
	Mon, 10 Aug 2026 18:26:39 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUhp-0000000CdA5-1uX1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:26:38 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so2355495b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786386396; x=1786991196; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kImCXwl4S/l00e8WQ0YV3wOiF3iZg+3YUcCfhwwyF/0=;
        b=ZlzfPPty8t2ZQJnMeK+Yg+sIPou/mKGCRRiebWtDa0J49kuMtmWcdIkpNNPVUKLAeu
         Z1iJUPs6QcbdOddKG7OCXllhlBkKPDSVrKAgK57Xv37C9HFoOIubY9JmL5aQUFA4PJao
         cfOF+kMtB8lZAGVmh4UTfUbfTsZ9XQRbNjPSdXz71IQUMBPygK5cbgxtBWAfuUoZtS9V
         8/6V5gn5yk6/h1XoudMDuaH/xzAd9E3JU7F1FFf/U1D/GOmUsDGLz+BsQhn0uFuTDwA5
         CxwwWOC6HMNVPJm9XggRJsjCffxZxiDcux+9wthseU8/fqSzZejAtmeZMidKwVvdFsv6
         Qa6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786386396; x=1786991196;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kImCXwl4S/l00e8WQ0YV3wOiF3iZg+3YUcCfhwwyF/0=;
        b=E7U+q02JGg8uqNK1L/xcoeg4vlSU37K+OZuwNXImHpH1L1dkWMcTq81YqiCH9cqF4u
         k3vXeNSUUyDSBgOgW75ShCMmCEWwY6L7QWax790MzYdYimzSQmHqxutAudMhtxcsavwq
         ixuoIgAjPrXZKpmbICihK30DjUpzsWAAYTxJhAXPx0H5BGIXYhdPpZmqzOYZv8LtgeZP
         WpHCILCVryeFYYXZsmlxI/PY331h++go9UhJyNq5We8FrJuvX2//RR03dBN/lpAM2J5f
         BZ8IbcvdN03B/zWsbosXwfftOPvIpcfbzeyfIKIdwYMp8RFfaQiJ1yjeo/enMPiEKhAy
         xqCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpza/jQawiSndWjRn5Qd+P+uVaQXODLX4nv2hw/uKvBCU39eFdrP+VojQgV2vMeh0INeEsUik0ReB7GMFBM9Giy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz09dLPnUla3CBd7QyqNwAWCnoa9sN4j0aQsZ3PJPRYAjP3cIN1
	VM0lPj4E07zOjPc6xRi03PTw8J0c9i8Q8e+ojSM95axSUbl+yjqE6TME
X-Gm-Gg: AR+sD12r6MGbn9CAVt7RUJZitAcyhzac5ZhrM4lDhQgbjelXGl+PLxisWchfyVk6q7F
	sNuQe9YRYQbhy74AQsIOo9YMyj+spEu3SHBiznvGfU61ZMa1nJIr1fj3oUYCJ0SFMkIxrEMV8iq
	VDXWy6vPusuQcC7L5K5ommCtIo43JI7Kt1i1DjdRdDGxYlijVCw6gi/yVoTl86Wx1VQJ2HUPuxb
	S3aBTa1HpjoSk9v2EvzPBBIbe6MVsPLX8GDY3d654jjFNH4uk70BVzfugFQ0Dz5P+U5ktLlp8j2
	YRfU4ykYUDFVLvuEq0eesAPPKcYlcXmmK+/lyuxkNsQuqGqY4IjcR3a6EIIa5D1XtYJ3cWrT7XQ
	Ov7mF4Bi6GXqpbfRORbsBYfBNYnoSduH4QHXk8kZzpoCVW/2jVyn+FhXR30jsXhnUwvqRpsnmLn
	uyl+dE6hIPgsUWBvobbR76m67hRcC+kaV9J7Y/AAXsvnpU+QIOC30P2d7fjuqrh6Gj+CE=
X-Received: by 2002:a05:6a00:6c82:b0:847:5ec6:3afe with SMTP id d2e1a72fcca58-84f2e0588demr52646678b3a.31.1786386396492;
        Mon, 10 Aug 2026 11:26:36 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cadf2sm4377478b3a.22.2026.08.10.11.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:26:36 -0700 (PDT)
Date: Mon, 10 Aug 2026 15:26:29 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "leonardo.costa@toradex.com" <leonardo.costa@toradex.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Sherry Sun <sherry.sun@nxp.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Hongxing Zhu <hongxing.zhu@nxp.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [REGRESSION] mainline/master: Apalis iMX6 no longer boots
Message-ID: <3hxiy6aaiagt5zunntpidaeqc4or4wrebf7mu7asvyyibqmvo2@xhvasdqp64rw>
References: <20260629143439.361560-1-leoreis.costa@gmail.com>
 <20260715234736.GA288957@bhelgaas>
 <VI0PR04MB1200862BE9B7C137EC7C18AF18CC72@VI0PR04MB12008.eurprd04.prod.outlook.com>
 <i6x6wpua7wlwmdq3hitoo53wkptgp62tvegmkabcru3d54eqg3@yk4eehwaarn2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <i6x6wpua7wlwmdq3hitoo53wkptgp62tvegmkabcru3d54eqg3@yk4eehwaarn2>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_112637_500680_DE164976 
X-CRM114-Status: GOOD (  15.57  )
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

On Thu, Jul 16, 2026 at 02:09:19PM -0300, Leonardo Costa wrote:
> On Thu, Jul 16, 2026 at 02:15:42AM +0000, Hongxing Zhu (OSS) wrote:
> > Hi Leonardo,
> > 
> > Would you be able to test this patch on your affected boards? Your testing
> > would help expedite the merge process and ensure the fix resolves the boot
> > issue you're experiencing.
> > 
> > Best Regards
> > Richard Zhu
> 
> Hi Richard,
> 
> Sorry for taking long to respond, I was caught up with something. I
> tested the patch and it solved the issue. I sent a Tested-by tag there.
> Thanks for looking into this!
> 
> Best Regards
> Leonardo

Hi Richard,

That patch might have introduced/exposed a second regression where PCI
devices are not linked properly during the initialization. Sorry for not 
catching this before, as I didn't have any device connected during the
previous test.

Link: https://lore.kernel.org/all/bl7i3obu2clzsgeoct2a4mtfhv6typcjdqmgneropf3hpgwve6@n2m5uhlduw57/T/#u


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E71DC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 08:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbkBgedk9g4m4xk1s2CtlgrYzdetjX0H3Ph35J0OZRw=; b=Am6cP3AUXuD58HJewe/0R4AZ90
	5fEgIW6AVCEv7iDEYVgpEo7pM98DUP1NP6s+VAXKa/0zYrFalrco6wNU69coZ821QuRoDCM2UTsqs
	tXxU/pR4mmaLCTZ7Tymru3438fK8wAM/cNp069NxSF/BlMU2UjpGqOjU+wM4oPlNOcN86ta26OLec
	topwChxawSOVb9VSesQrWcyoamLH2FmYLr96qPTTXE+Hwx3gpCKUuRZ0jTja8szDRSfP5enziCiAA
	djOOwQPB59BnaI38PbNrBfZaNtQt0mKh800Zv6eqe22bkgum2xAofKZMihk7JcbQY8tFCvmm8cxUX
	pITfXAIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKKw-0000000CmIj-2qq4;
	Fri, 21 Aug 2026 08:10:50 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKKt-0000000CmIE-447b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 08:10:49 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so603457a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 01:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299847; x=1787904647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dbkBgedk9g4m4xk1s2CtlgrYzdetjX0H3Ph35J0OZRw=;
        b=Kiz+aEATDl6mi+KekR+zDFTf8grpwtfSScvqfbQoGXxklk1qgDhglouTOReGrfSfrB
         Xi9xwPdkhzSC4ZpSsZCH2vzxrvT35C5KE+a8Yqdg0Xjpv37yc/5c08X4kjOEqgoXjtSd
         sASIl2dOCJEZD2w2hd60FWmWLplP3ipSMAMouXj/6n9jDD83BOOFDKBaBsjvhqS0d1hy
         bGgKHkMcmIN5xZQqNPUu0y9iX05Ym9DXmRkaIjUAyQUI0Q2/9GH65h4MoR94vV+txh4/
         uQbpXXLQozmoSO5BTEiGRUP+lBOsEQ4WAvVWS7ydRqqkdmrS5fLAegA0/Vd7zilIDBE8
         bfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299847; x=1787904647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dbkBgedk9g4m4xk1s2CtlgrYzdetjX0H3Ph35J0OZRw=;
        b=a4DLJgaaWSL1u7llFw2y4ZpieJhGnu5fEmVQWxrVbFuUNnyTBD1kfbRRRsCzfSdE1g
         CKEX5vcG2xhzWig+xocyC2NWGh2eWwU4xUVigR1iUpkreOzPqT3XEZhbaUrBw1XpZF+9
         RNHMpuKMIj3Nv+HjtpeMg2AGkjEbpZ2DKXXwVGmE6xbkcKflhf03jt3gszV3vk4VLDvp
         PmfIfivK8ECTLpa9x0MKsMJWUTgxmKYGDomzfZZ6oJnuQbLdtzgh5J8S6Quvbf7jdOam
         /phF79xfc+5RUbFdYL8XfYxW9RyaTbMH0qWm6veg7N/0rkRwXsZrVUyk3jcM+yMNIccN
         JkxQ==
X-Gm-Message-State: AFuF++kGafkvZhpA+vRXKAfJ1hc9QwxPwwXNMI/hG1xuKpGhXeFcqJQg
	YWPSN+2to+ubO+VORHzaoNzYc3QfropGQ2m+nWDXeVI2z1TWvaR9X50=
X-Gm-Gg: AR+sD13LgSRfmlgLDADRWUTt5cgzIzHBL4LPEM+LWNrQVGGcNPADdjakBMZbEC7b9qI
	Kps4YcK504G6Dhp5UI2MS6lYhtiSky6asOWrsNv17acPQcyrXxemmMdJk+U4CdW+BMK9kSwTxnW
	F66u/8mdGxHd/YtCjPxtSSExvHKrCNKb/+Zagi8RMlPmEg7X+C0DjcxIEAhkFulMTycyggXP7UX
	0+nHLuRslEWFPJDbWQ30CS212PrcbYCl+0IQRWJOMF/MTrtFDWUcz2mf+7ROHvwY5nCagyKzWdC
	9BWMrtzZFx8SNFLhHmU28NktwQTQGRnxKpm1aPKjOK8UvTzr4lKEf4/5llBub2EVYOdhDW87vbL
	8D9ZeENCPioMZ0YwZBljvbIh7alXz0rqRXOhr9j8Ho7dHi5F/tR7wEGKn7ohkQgqmuoa/DbAbz4
	Qlj2mqmMrwVvuEcOFa3zXaAANNeVIGGoy0yX0Zi2wDuzSHeoGnSoHwNA/zoGE52Gg2ceivpCsTS
	Q==
X-Received: by 2002:a17:90b:2785:b0:38f:23d6:b4ad with SMTP id 98e67ed59e1d1-395c3594cf5mr8901925a91.8.1787299846867;
        Fri, 21 Aug 2026 01:10:46 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4570aadsm2126738a91.3.2026.08.21.01.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:10:46 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
X-Google-Original-From: Triet Hoang <triet.hoang@datalogic.com>
To: krzk@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com,
	miquel.raynal@bootlin.com,
	triet.hoang.dev@gmail.com
Subject: Re: [PATCH] memory: atmel-ebi: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 15:10:43 +0700
Message-ID: <20260821081043.280014-1-triet.hoang@datalogic.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <304a5498-b43e-4ffb-8714-29575f2534a1@kernel.org>
References: <304a5498-b43e-4ffb-8714-29575f2534a1@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_011048_009255_659ED22B 
X-CRM114-Status: GOOD (  10.64  )
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

On Fri, 21 Aug 2026 09:45:50 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> So I should respond to every email?

Hi Krzysztof,

I am sorry for the inconvenience. 
I understand that I should have organized the patches 
into subsystem-based patchsets instead of sending them separately.

Currently, I only have these two patches for the memory controller subsystem. 
Could you please review them? I will make sure to organize my patches 
properly in the future.

Thank you for your patience and guidance.

Regards,
Triet


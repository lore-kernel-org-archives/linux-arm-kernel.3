Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0133CC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 22:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGmlfvg3E3qxAvzs/3LCBaMCVhVs8joJvhg37L20skQ=; b=xa4Lq534yH778gnR92yok9WRot
	T87xeLPQQXc9Nt9KiOS6uMub4tAtg4vTqL/dfDnDyyGOuIkvSgcoyxlF+D66TZnbSBLnmj4c2RZqm
	ajJRRcPJNFIH6Q83cOQ9n/NLlkta1QYh4kObExihgLIFDgJz5uvETHX2zWIzjV+TEOD9Vi0utgK17
	7+ZLjcOYg/PC8iLMOBcI4Q8vcUYpcwkvO30L6ociJw46KuZpPXK4+r9BQqNHLJFwaq+Tn2hSymj3z
	UNn0Is0rjSHg3KihBQQ3amDbhP5b4Vryt6XkQDGBRcYGfcT82026/id9C5GpDK8SGeIXvb07t6lsS
	+bYnmykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMP9-000000035Qz-43pe;
	Wed, 26 Aug 2026 22:47:36 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMP6-000000035QX-1cd8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 22:47:33 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-9387752a4d0so46496685a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 15:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787784451; x=1788389251; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TGmlfvg3E3qxAvzs/3LCBaMCVhVs8joJvhg37L20skQ=;
        b=PtnEGXATdk4KowcUokwITOwAIUnxJfOmb4+UzmrnXQgPoIGSZZFaXMGdFSrseJafq6
         V8JAzaZWKKWztrEOaF0P4mJo6ka7gahcx9FwBCJgRO2HKohPtwiheewITOFuHfKKuzXy
         UtYUdVEHVugeY1iMPUX9GJNUSrW5rxCRAPllRHT/sK0t/zbnetcLIxqxwrTFS2PnMXU5
         BDn7utJgZ8oNfRm5U0bmTYPEr45fdg1fv8DBvuAubQVSZBlPPZ3qMoOUOsbZamDsfnhO
         e0fhmcA2ylkOsy43SoP/42KKcR4o4R6ynAAjZhu5qZ9xTQF1h/f9YN1W2QjuiJNSY8om
         GwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787784451; x=1788389251;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGmlfvg3E3qxAvzs/3LCBaMCVhVs8joJvhg37L20skQ=;
        b=GmOVCdgZOnVN2+o2VDduz8a5vp/t9MLcgAzmfsSE9UYGwCH1kURBr5180cw/gIIB/z
         bC7o6iwlUC/qq1qOXPTK+ehF6OXIwVVsEWLpIbsqFln8IHPb+cNXrTCJjUzmsQ4mSmwv
         8+pCbxMxT8mRF14g2FZIVB05iKPO9CKTRYUHYNCS4vNqKeLIZbyzDFCgTcusrhrv4+5X
         euV/2Rtz6KENefxjsdyI97n/tE0QNsTJlxHg2njzUQ6SqXIES652K/y8PTUta0DJXTmL
         I2JBvkhz+vcuEgujsbpgDBNwk/krwBiPDNkFTIJhWzbM9SSDrWvvGzRxL5gz1wtRP3y/
         h1wA==
X-Gm-Message-State: AFuF++npUtD5ajPBCskElc8skW01SAi8V8qEU5WDVDow4ijVzWhNe8Ay
	Fnkv+XendRoQFYeKeI8oOkV9k2Q5fLjPZDw9L6oAYsNk4r4I1T/dRfn+
X-Gm-Gg: AR+sD12gOKyIiIir7ZRhBNPx9uVm6fDEbgUXAJ5srH62V6SEnpAyjWiiOvM+XGT1y1Y
	/sHZY1oWlObhQa/MEZDGBZPxf1wiApaYTXzeQrOG5UaygLQD2lbrGIx1m+bqL7pyusDkelej7HA
	x2bLZ+cq8ehqMTYBxY+cuG50MDhsf6SFNm4gGPIc40eoLlBbX5t9L8C4y3bLzSrG/EFhD2KbzE6
	WNtoHfAiV6FCZ0s8YoKSigPDJDR0R30jPSMYs1nGICJUD8MNM8Q96yqc1dwS5hRciDhd5JaYvQi
	Zp/dYjdNocgyL4PaH0wSikIZ15jLBHno5oo/uN35Tbv9xvqH6fHAFa1yRjNVHZfkJzAZ4eNg1Uq
	kOGKf5/QpRhGG9jEzxvV1bW8Ij2fNU9LS2n9PCs+AgFEbd9AakQaZbVjhCj7rfdNCXfF3HzEynw
	GXsVywOOqIbuEkmoTgwedYqqP0xkoONeFVWHBghQXEkd/v21lSIk4FlXf8i9ONTShbrThBx5qeP
	2o5nKdnu7u3hDljK+t4zVQ=
X-Received: by 2002:a05:620a:7085:b0:914:b9a2:f29d with SMTP id af79cd13be357-9378041f08dmr1088154485a.37.1787784450800;
        Wed, 26 Aug 2026 15:47:30 -0700 (PDT)
Received: from CW-D0XG2Q16P7-L ([2600:4041:5d54:8900:dd0a:e212:7941:39d5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e30cd96sm317290185a.6.2026.08.26.15.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 15:47:30 -0700 (PDT)
Date: Wed, 26 Aug 2026 18:47:11 -0400
From: Maxi Saparov <maxi.saparov@gmail.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Seth Forshee <sforshee@nvidia.com>, Serapheim Dimitropoulos <sdimitropoulos@coreweave.com>, 
	Maxi Saparov <masaparov@coreweave.com>
Subject: Re: [PATCH] firmware: arm_ffa: Unmap RxTx buffers on device shutdown
Message-ID: <ao9sWrszkXwj5-PK@CW-D0XG2Q16P7-L>
References: <20260826222337.73480-1-maxi.saparov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826222337.73480-1-maxi.saparov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_154732_462759_6A063CBB 
X-CRM114-Status: GOOD (  11.04  )
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

Apologies, I failed to spot Carol's earlier patch for the same
problem before sending this:

  https://lore.kernel.org/all/20260818224404.3694580-1-csoto@nvidia.com/

Please disregard my patch in favor of that one. It covers more than
mine does.

Some corroborating data from our side, in case it helps that patch
along. We hit this on NVIDIA GB200 systems in production diagnostics:
after a kexec from a kernel with FF-A active, the next kernel's
FFA_RXTX_MAP is denied and the driver fails to probe until a full
system reset. I can also confirm Carol's observation that unmapping
the buffers alone is not enough. The notification bitmap is retained
by the SPMC in the same way, so the cleanup has to cover both.

Happy to provide Tested-by on the next revision of Carol's patch.

Maxi


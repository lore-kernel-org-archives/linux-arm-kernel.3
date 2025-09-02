Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14D2CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/IIRX6cZqHveyVdK0XoeTwBR6D1RLXmC/fK5i3cAlQ=; b=h16NrVIG7BxGzevMArqT37WDtA
	a68nMXc4mJMknmu8TIqkwO9TmaFxW+egSNL3VwGy4Dxu94ktqsobbbVJjguJz6stFvByiVkVMh76q
	+bN7xWmZCBW60pHnJsMnxCY08P6GVhTvNB2mNREHQHhOpS8sB4u3wLOKRVj9JwpQA3cHmkn6S4IrS
	NcHXkdXxtkfrDWYj09FVUJEojddxmPuDbFAB3SkREWModOTifdY+qvhuUsl4Xe+kRawFPA2iBHdHx
	pcp5RUXQhtVwkr5Lgf9AScY5GoM+um/7JMzrJvbyz1uhFlVB6kNEaVrZvKZAz85wEcodTVLoOCel/
	kqb5R3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYlz-00000002ARS-3MdT;
	Tue, 02 Sep 2025 21:42:39 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utREY-000000006Js-3T4R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:39:40 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-24b28de798cso2850355ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756820378; x=1757425178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/IIRX6cZqHveyVdK0XoeTwBR6D1RLXmC/fK5i3cAlQ=;
        b=KVuHgHw5SI5E8zox28TzjvsdpjdJq6ZvkarRx1vWLbZhUdqMASjUYCVfqAc9s+ETxA
         /lEPr2768Lpc+5DrT61WJvVixkWB6LlSm0/6jtGaCoj3hIdcvbk/9yLuMoQ4bOgWNu20
         YqTN9DsX+uW7X/4fMz0lDpO3AEzhzzynIyRcyDUXQ6G4/q4RAZnmJBP1iRBt4BJRprKD
         ElA4Cy1hxRjNaL6xKMhvHpVU8I4FRrrR43PURsD5r47PQpyIULffcEZhgDrDy+tXHdbb
         MFPUzYaPEUBHMCYD60cLZnUieW/WBJNuEkEwd4v6KOnIPBRIDMGxPOq/zAxpwooSIaLp
         ppWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756820378; x=1757425178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/IIRX6cZqHveyVdK0XoeTwBR6D1RLXmC/fK5i3cAlQ=;
        b=r9Tv53Y6k8ZnVk72Uhebv9QVqwfXVEktMFwf4yjiO11htq8HBE/L6A+1GwvPZcaL/a
         ZMegWWDNKwxzQjbywWBiTxiHTmgPIMbQjV6rI3mlmO5RPpHRI1CgCvQOnoyXBRY2Is73
         UPmyiZmWht90XsrcbetUllHlpp3kDjRm837w1Ch2XbfzjNBQC3CyRTNqXvU1jK+x4asx
         T2QLDqYE02oGPDUScRW1vFquaVn1DwV5xhFuJjGBWloTVbS3JeMKH0FsR5kCWWFFFFD9
         XgYmSbGJy31TSeXNhL6DBPcg/pDdLNrkwkSsJwhogpnvFG1gdnZkRbXZeVFKuqCEPXDy
         T3mg==
X-Forwarded-Encrypted: i=1; AJvYcCW/dQKAS53lm5WoXYBKN+ZjVlpylno3OEuux5V7GCFrC8QlqJJFf0rhoJkkHZ6ltpE11RDJ2bBBnotMllAYBMM4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzynu3eDg6mbsNUtwAS3HuIDJD4CKHtuzNX/i3Uj4Xrzqpqz1Ar
	Ci7P3sWPLWlY9LE+wm7RphG9dxKClKAJPpG1qMmEWyRJffNXqEfjdL/e
X-Gm-Gg: ASbGncuB6Re6MRLqqci8YxGIEb9utNqkjDLfr6XJUftx5FUIiZOEWsJBQPklJOIbkyZ
	kpJyoQiiJSQyt/0nvWJMxsz8ZQjKfjGFy+yhQR0LWMcOkehrtYMh5hsB07HEFJobd2y5Dckp+4g
	FMHNAviesa8zBqFJ18A6t8vklQcdq6jgZCOQgPnNVQq29bDWChzOrC1S3el5iSG2iH3ejiDAkv3
	ulKrZtggY5ZccMqUyzXua8Au9+78bBeQP4Q0B/21KVzO2/Phw7SIBTtCQzg3LCfUI0RITrQZCA3
	y6kFtFyDj29WqfjN3p9BDqP166CxF9Zca9aA/JP09eexzjkGd45vMEeNaIoeBrNvf+7EPSR5hKx
	silBSV7WqGB1j5uTFYsqAxVpgjmzL0vGty9a1/n2Qu2qnF9UeZJ9ubIRnrdoJ8EsPrblqBfRi/t
	M=
X-Google-Smtp-Source: AGHT+IHGByeGR+KKpc9TABQ8v/iqUMkl7uHkPzP2VMOjxHn4SHTGndfvld/gXSzjgYNEmT1WtaMBIg==
X-Received: by 2002:a17:903:384b:b0:245:f7f3:6760 with SMTP id d9443c01a7336-24944b20cbdmr139026075ad.55.1756820377704;
        Tue, 02 Sep 2025 06:39:37 -0700 (PDT)
Received: from kaiwan-dell-7550.. ([205.254.163.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24afcbf0268sm33957805ad.8.2025.09.02.06.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:39:36 -0700 (PDT)
From: Kaiwan N Billimoria <kaiwan.billimoria@gmail.com>
To: tglx@linutronix.de
Cc: Llillian@star-ark.net,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alexander.shishkin@linux.intel.com,
	anna-maria@linutronix.de,
	bigeasy@linutronix.de,
	catalin.marinas@arm.com,
	chenhuacai@kernel.org,
	francesco@valla.it,
	frederic@kernel.org,
	guoweikang.kernel@gmail.com,
	jstultz@google.com,
	kpsingh@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	mingo@kernel.org,
	pmladek@suse.com,
	rrangel@chromium.org,
	sboyd@kernel.org,
	urezki@gmail.com,
	v-singh1@ti.com,
	will@kernel.org,
	peterz@infradead.org,
	elver@google.com,
	namcao@linutronix.de
Subject: Re: [RFC PATCH] time: introduce BOOT_TIME_TRACKER and minimal boot timestamp
Date: Tue,  2 Sep 2025 19:09:08 +0530
Message-ID: <20250902133920.973210-1-kaiwan.billimoria@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <871pp14pkr.ffs@tglx>
References: <871pp14pkr.ffs@tglx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_063938_877528_C22FDA8A 
X-CRM114-Status: UNSURE (   7.37  )
X-CRM114-Notice: Please train this message.
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

Subject: Re: [RFC PATCH] time: introduce BOOT_TIME_TRACKER and minimal boot timestamp
> Under the assumption that nothing on the way resets the counter.
Ah. Is there any known component - within ROM/BL stages/kernel code - that does
this?
Forgive my asking, but if fine, will this (above-mentioned) patch be taken? So,
knowing that, we can proceed forward..

Thanks,
Kaiwan.


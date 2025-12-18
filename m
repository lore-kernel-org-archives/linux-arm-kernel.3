Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6AED6ACD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auj72bQKfXEBr2u68dWzZijoBsCuhcqMu/4EXNR4iyc=; b=Pl66lrZR8Ae98Se766ZQdGA/JE
	NuOZ+cu01+lfg692TAk1UTfICA1RAX8UQHSayHNojA3UnVxES4YUf63/GvDE0mG+yvYSpjVJGWv1C
	KyrTlvdPIDUJzPMQeFTkiAh7z1cdBguvJoBAUOUV33JGiwf9908gYi+kPHInGWVPrors8NvYTduPU
	+zh1Xb6yqNtl22MRfKkpkQli2EsqD2ICJUtSaz142VDv4sV6/zPWK3FV7DZj3CvSeQPgs/d/gu41O
	w9vLvFy/VzczhmRsN7yGbYWAS9RMqpPSNAG+v1+2auj8+p8NHo1NfKFupSUmEUCk1zHOGotKtUspt
	5/prFoCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWALK-000000089B0-2sB4;
	Thu, 18 Dec 2025 09:30:42 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWALH-000000089AO-2dyr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 09:30:40 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-430ff148844so618497f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 01:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766050235; x=1766655035; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=auj72bQKfXEBr2u68dWzZijoBsCuhcqMu/4EXNR4iyc=;
        b=cz764STQTQI3yj4Jl8WXUg+DY0w/EJQ5kelVmndWIUpsx6QlmyxBbdwd0ZlVP+/WZj
         9wDOcdU7WmGnNvSGDFrcq3pSG2CLKY4ftnvaUpOdvUS1ZBInG3ICktCrVpqfCtpvAChi
         YqxCV0V3T/mq/8UnEaOY5/w/i+e50xmyC2MOjeYoLI09R4Ln9RrAj5GA+qQZODxrlqcw
         nHVVMql4IHdMNek0iN5U9aovaT0ndMDBI6frVW3hEUSA3D+/ktLY1MeRZZALZhb8PgsY
         qYLk+bf87URowBKWGs84JsZQnScUFmX8m7RDrYIvhVYUkEugmol1iIG+gLK/4Ad7t8Cu
         yKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766050235; x=1766655035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auj72bQKfXEBr2u68dWzZijoBsCuhcqMu/4EXNR4iyc=;
        b=IUflaseTevy7dhoszfVJY4weujrK4BSf/z0WKiAiJxVBbZqKlgsOMF7XrPafVSrTVD
         N+ZOtkgW0b6cD3QIlGQWiUgYGCgiSd/XAAMC03CDflYAz4eDIje5JS/wCs6vOZ5tPeLy
         8cK6GrTneFuuCqgNvKTpO//OTQ3lHGT1v2Xmq613fZCvoHD6jAvQz0dQKRZABOUqSV2M
         qk73RU2KCbh1xT/t0JLk8T5OHEXbw4y/4sO1L6sngy1u+HU5SEb3aydVb9uSMUbNKD6F
         NjywrsJ/bSTxEDvAC9iDiNR1om/7elry9T8GQFPMHx0T3LD9vR0zxs6G66qRovbijqFq
         GVvg==
X-Forwarded-Encrypted: i=1; AJvYcCWDsnHmUKnN3bVabeSopQFUDqALJGkAJ7t4+ulbK5Ly3Xr/PWxtaplGGtKeQfiNfvMGh3o0Fu89BxWkVKiHt4w0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7PJkRXVpX4nQnMOmw0FPe+ReHZO+Dhiffk5IEgCC66f/FqJWM
	VbHH0i9Qw+daqaa67C8yzhhtbnjuA7/PHFxY1aGpOUaOt1LbSZAvzIorStul05AscUc=
X-Gm-Gg: AY/fxX56UBjx6yLzuCCRrrZJZDCzq/wujZJTPLinyxRCEA0Uxm7esdyq6so8rdhEbQB
	Jcg+l3nbOfUsFxDnnJ9RnVsjCJmjGGCPrJOrjz3JwBDmW+O6POPJyfZk9YSYQq84pHYJMONN/A7
	VyX4BRTV3HBd4GpcvjaBMAu0N7cjvBUjwFygFjlMHA2QUXYeYL5vupKlcXqcCtOuqeoNiSCjZVd
	XX45VYu5fQwMSpZ5lBPvDx6ZEBr/wKgloKvLimjh4GDdf8R/fcZ3QylU8awpiHgO35yxv4xSVJS
	JYD27vI6ltIxfwFjjnlmfQtKHRlUNv1ylTRCmsOXsCiaeKDUMKF9kqfV30YPXdf4DiXObGnFgzf
	p6b8wNWiW26QGmIuxwk91v/ITWAq7qVHmC2y5ccWj/vLygnsxBMNCF1viH8ijlsIllkb2198Yd+
	qUQoWp29eqwbB0bm65vD9cuX3o
X-Google-Smtp-Source: AGHT+IHyh7gnIimLVB/hVii5bUcInWlX+sJTJLBC1+RURn9zto3ffEvz7ijXdEVgop3qQY9DVJKifQ==
X-Received: by 2002:a05:6000:2407:b0:430:a803:e49f with SMTP id ffacd0b85a97d-432448b7f43mr2778068f8f.15.1766050235424;
        Thu, 18 Dec 2025 01:30:35 -0800 (PST)
Received: from localhost (109-81-80-251.rct.o2.cz. [109.81.80.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324493fe32sm4092572f8f.14.2025.12.18.01.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 01:30:34 -0800 (PST)
Date: Thu, 18 Dec 2025 10:30:33 +0100
From: Michal Hocko <mhocko@suse.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com,
	song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	jolsa@kernel.org, jackmanb@google.com, hannes@cmpxchg.org,
	ziy@nvidia.com, bigeasy@linutronix.de, clrkwllms@kernel.org,
	rostedt@goodmis.org, catalin.marinas@arm.com, will@kernel.org,
	ryan.roberts@arm.com, kevin.brodsky@arm.com, dev.jain@arm.com,
	yang@os.amperecomputing.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: mmu: use pagetable_alloc_nolock() while
 stop_machine()
Message-ID: <aUPJuZINNuNxddRX@tiehlicka>
References: <20251212161832.2067134-1-yeoreum.yun@arm.com>
 <20251212161832.2067134-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212161832.2067134-3-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_013039_676121_5E5965BE 
X-CRM114-Status: UNSURE (   8.85  )
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

On Fri 12-12-25 16:18:32, Yeoreum Yun wrote:
> linear_map_split_to_ptes() and __kpti_install_ng_mappings()
> are called as callback of stop_machine().
> That means these functions context are preemption disabled.
> 
> Unfortunately, under PREEMPT_RT, the pagetable_alloc() or
> __get_free_pages() couldn't be called in this context
> since spin lock that becomes sleepable on RT,
> potentially causing a sleep during page allocation.
> 
> To address this, pagetable_alloc_nolock().

As you cannot tolerate allocation failure and this is pretty much
permanent allocation (AFAIU) why don't you use a static allocation?

-- 
Michal Hocko
SUSE Labs


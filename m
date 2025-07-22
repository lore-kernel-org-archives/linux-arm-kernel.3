Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A22C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 19:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWwanWZIN6VJqRUWaw2x8mt5qLkeBEti+V7m7T7sRfo=; b=JtgyTFKR0sOF2O6qpyR+kFAhOc
	STS3nYjkxbUPW3LSi43j6CEwa2XDxuWnSKlUSXPcrX3WE7k8OLCvBUv1IRLC/1Mj9yqWpvxAhbpbZ
	xlRyaJ1Ku0cgtclU83qtN+V5uGHg+PbEnCGAJvaPL/cyA1+3PL4EawvuEE/lEmcv+mHXD5xy+rH2c
	I/IHt5nvSmuUBwNhqJXGIciGKSqRkYm5YMyKvbAGRhlYKtKZkIpFonudkdtGZxWOP3ZcSC5LqPA3+
	Gna+qQvtDcNBK3rzUph8kdiCuDxXvHECLYWQSKG25yWzA6IZceOzHk1ZYUjpqw0REQWCRzvhUbI1O
	5iF21S7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueItz-00000003Muh-1sFD;
	Tue, 22 Jul 2025 19:43:51 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueIq0-00000003Mbo-3MhW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 19:39:45 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55a4e55d3a9so690980e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 12:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753213182; x=1753817982; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oWwanWZIN6VJqRUWaw2x8mt5qLkeBEti+V7m7T7sRfo=;
        b=EI/pnjAUyVmXfrYgHXyrfgTLY6If5w/kOC576DBqz+uTpTiy245wStMaYnTAUi5qCq
         psedE7jwNIocOmaOZMf3sw7xGXqg5nsYDdbB/9lxrNg3SXOnVvKP5RBj1XyNAASmb7OV
         HoDEnqz6U4ST6mRq3z8a24ITYbsDzgAVGpZevSzLDMrX6ONLF2yC4BSe+H6ZPXqSmOYQ
         IWkskOfNiVwqHu/wM/dCWSY+xrkmF4iWEiTu3PA8q21nLlP8JJKdjdShkHtEPlaObRlt
         nlO25I3aIiPdacX1ggvB+ZWlZDFyBOFdB0iFsTMcJpiToqgDb4SeEXfXH5tMpXCMZzYT
         NShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753213182; x=1753817982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWwanWZIN6VJqRUWaw2x8mt5qLkeBEti+V7m7T7sRfo=;
        b=Hvpa2NvWuTRGuoZkHNN07FzVlappKbXwRllpbwAPO25pd51kM0bz1LUuS2/+dQ5e9f
         TnQxwfV+OZrlmUctqJdoJnzHDhF1PGMPh5SIQ0i+S7yFsp7R234LDUVWg0LFUJ5Tyw5t
         0bUxDJNTBK0N2dtuNbjSNNWxXydj/vN3wp2gEy+7sTKfotQ++d208qE82+9RKiq919oD
         +4mVdsdZH8EbfEzL/Z4kgf1YHhIdrxmsuf0wS1T+yJ1Y04mGpOqIXYb3XMa3ckbVDRNj
         8HxUBDdwRiGFfLG4/UMkMQwcISFubwO0QvKU+nQ9miBV14M9wBU0LaIJRATXsGj3PhKw
         mU3w==
X-Forwarded-Encrypted: i=1; AJvYcCWMKEu0POwhR0ykwIiurgbplQpY/hh/YY8HAudkvGrdhPOR2mtQ6athpxpmaOAX+RCimkJC9jyS50kqp2Ss4etN@lists.infradead.org
X-Gm-Message-State: AOJu0YzSHmL6xIzR2nzec4JPWUBOlcOmrWJL8bKWWpnrBfWw4MV8NfL8
	IHzgwSeA5eB4AMVs1pL3l7Bvbi3B2o7V7mRLk6OrrQhxWLUB+YPAo9sH
X-Gm-Gg: ASbGncub1uqdZwxmraXLKGAOe+aVguzqkvnSehzwyBuoFiZVANzAuPcj8JxH+6lJkin
	pwRlZds37n/srEE2EdFYJZ5cDGYPHuY4rxfJzmNXj59iiQKgZ2HezhuHJ5eSgzEEfY/8woKUS5p
	XpkPyER76n1c2iiVGj0mBXIFoUg4CgA9DXkbLoAzF+gr27fZZhPzydrKCXKaflgUvNsXctqWyuT
	zfPXPQC35l9DHRWxVA11gOWz9qkmCMh64Bv9ztvzLJwDqWPTlU9zc0C5CopJI5Hqs+5VHMJ+az1
	Uh8xGw09UJNNAUd6FhJP0E/GZ9dQTG5oOMpRv+uI7s5lwdBelWxc5PQWMYiaFVh/
X-Google-Smtp-Source: AGHT+IFbHt2xpyOsVVT8UPF6x/qDC9IiOeFqzRPNDED4QfUqrtireW40AQuhtFawGjwFKenKZbGixg==
X-Received: by 2002:a05:6512:3daa:b0:553:2f50:5dff with SMTP id 2adb3069b0e04-55a5136aab3mr87983e87.17.1753213182060;
        Tue, 22 Jul 2025 12:39:42 -0700 (PDT)
Received: from pc636 ([2001:9b1:d5a0:a500::800])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a4eb36cf9sm139815e87.222.2025.07.22.12.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 12:39:41 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 22 Jul 2025 21:39:39 +0200
To: Jia He <justin.he@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Peter Xu <peterx@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm: vmalloc: use VMALLOC_EARLY_START boundary for early
 vmap area
Message-ID: <aH_o-85T-EexGWrg@pc636>
References: <20250722040850.2017769-1-justin.he@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722040850.2017769-1-justin.he@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_123944_843144_47F172AF 
X-CRM114-Status: GOOD (  10.94  )
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

On Tue, Jul 22, 2025 at 04:08:50AM +0000, Jia He wrote:
> When VMALLOC_START is redefined to a new boundary, most subsystems
> continue to function correctly. However, vm_area_register_early()
> assumes the use of the global _vmlist_ structure before vmalloc_init()
> is invoked. This assumption can lead to issues during early boot.
> 
But we just should not redefine the macro. If there are such places
those are should be fixed, IMO.

--
Uladzislau Rezki


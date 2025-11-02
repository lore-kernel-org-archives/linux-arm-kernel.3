Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEBECCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 15:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQ96rEK2xyiZuk5MptrQuva29zVxFbypQtCJr8WgS04=; b=Z/vCk8uBUMU6MmvT/k1bYHRrm7
	V+RIuNh5LyzSfQRZPRFQOwm+SZglPNqFUW7zmm1XGHmZIlf7a2apTYtWlp5DbICH6P2XP8GswF9Fl
	3VdBygJ1SNHoMcDQXJHMtbCiznx/hrcRJrvIbnZXHMun5me+MkF8ZQkUiyHY7OPz9D3tAl8BcZGlt
	XzPKDzg4sDDyyM7vt4uUAXuZTxAUVF0s4W4u5dyiNjmZ1UBBI7cOO7Mutms3LO2C9NfaEObkkFCsz
	LXqxVFEoXClqMHL9geo2fSnStZ+0k/Ab1qjSAeUCZ4iJQIwSbcegn+q0WLImrd/ebi4UJJil1SBFp
	M0O3Ax7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFZmJ-00000008bHE-0U3g;
	Sun, 02 Nov 2025 15:13:59 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFZmG-00000008bGt-2Uo6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 15:13:57 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-782e93932ffso3507618b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 07:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762096436; x=1762701236; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQ96rEK2xyiZuk5MptrQuva29zVxFbypQtCJr8WgS04=;
        b=cWuj0oWjiQSdf9qPU4nBK+zhDIzD3/KPbr6TLSQT20NdUg0IjUBy9Ygzc0Pv55sLBA
         Q/CyeHERl0B71Vcw2qGdmBs9UNXc/+6x/Npf2KQPSrR17w8CTq9Ly1fpzIERhyJsMu01
         fQbsMIfyRJvUzvbXN1Aq0T8PMRUbKutDAIVzGJtm97NIHVa1/Sf3E6FWWYHN39kJzAeo
         WFXOsXdAK5eiuwYQKvlQhXyL8d656TI1E5GcoOCQn3ykvSOpcVDZlg3phxmqg3SUxRCA
         WF+ujZwJc43cdPQfUN0KCQpqMrvnlVFKjRsQ7RQy9BoWTboG4bm249WiG0V9/7rfiZWL
         v8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762096436; x=1762701236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQ96rEK2xyiZuk5MptrQuva29zVxFbypQtCJr8WgS04=;
        b=uVQOy1/gETfFeYW6DK02W2LNUWwp1nUXomhUoI5wkcOSTsHbiUhMrtaBoc1Mn2TlQP
         zTxnvflpNMvidRoqkCVUihvcBxQ9LMOErNo8Yh76jYpG6ujm5s5aWzTsew+CiDYbL/YV
         OdgRqlNMIlMRfR/RUk+j0SiDfmMBXlM/ZtFIGEHyCT+KyieMKFqV6CzNPhTYpRCHF1KP
         0BrGtNyM/1v6ibacd86nuLlVHs5TsqSMDAIm8zAyoSW8Rsp1bMU8XWLq6Gl4UAkn0CyN
         EcWaYRYL427/ITa3NlQrGv8ouUor4HNmHTpur+gEkX9r5okHgddYq+Cq+ujCxw3l882W
         ii9w==
X-Forwarded-Encrypted: i=1; AJvYcCVubstd1vZOjMWGGskpftTK/5RVjV0OaoTB9KoPcpwitGk1CCbQtqGzMxLLKTTA3zJGDyeOLsQBy+zHAS7sK1FZ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywei6lzLUTeDWM1kCsi6UOuhqXPubNjFCq4CmmBmP2EolfHR5so
	iKs4SHQNE4xsPpumxlaTtr5wbJw237rdUZvRkWi0r9DAmDtucIvlDsKM
X-Gm-Gg: ASbGncv1i3Muh/iByWCNcT9WVNYIlkVvtnEegdmELNZrtttRyasLCfRHQaJ6oREiuEK
	QDzdEz3NNAQj4pEofmyrP2Lq+EZDtlKdaAriusUiY7o3FKivgDyrdJdku4ZMcx+GiCbD+3f1qjX
	jufY/dk4eNHlWNtqsDr/gCR97jYKitMwTnFm7ygz1LIVC56VB3WRlGZWf0AIVHHHEj4bWrzNMky
	/I9bhynpdmSk0dh52ovRYOpWgIJmhXWuHCNti6kzDwUscZ/7A+X0CRAd7QCuLIDesUM4fIhDgtp
	hdTJ/S8ZxgVDkUsVDMNAkVCZ3BYjSoVfYojcFsPuKucvcINQI9xOT4sZLUYeoBffG5w6sK1I0r4
	Fm4bA8hHdJvOdUVnOap0IVm2hlXJrXouswA9YrwUued/nEIhbsvybzJp/biq4XUQmS9fVBs6cUr
	m5DyERnkIfDmr06lGKbpehmpc=
X-Google-Smtp-Source: AGHT+IHmHx0E8ppASVsSFwTxa9r2hNMFtx0sc3Lf3WuBxMBGncC27kjjGIjwdZRARbJZUcJWV5aISg==
X-Received: by 2002:a05:6a20:3ca3:b0:342:6c97:3693 with SMTP id adf61e73a8af0-348cd21a90dmr10207159637.47.1762096435632;
        Sun, 02 Nov 2025 07:13:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db87340esm8103609b3a.63.2025.11.02.07.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 07:13:55 -0800 (PST)
Date: Sun, 2 Nov 2025 07:13:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, catalin.marinas@arm.com,
	will@kernel.org, akpm@linux-foundation.org, david@redhat.com,
	lorenzo.stoakes@oracle.com, ardb@kernel.org, dev.jain@arm.com,
	scott@os.amperecomputing.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, nd@arm.com
Subject: Re: [PATCH v8 3/5] arm64: mm: support large block mapping when
 rodata=full
Message-ID: <d08c474d-4b4f-4b75-827b-e7da550a6dee@roeck-us.net>
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <20250917190323.3828347-4-yang@os.amperecomputing.com>
 <f24b9032-0ec9-47b1-8b95-c0eeac7a31c5@roeck-us.net>
 <933a2eff-1e06-451e-9994-757d66f4b985@arm.com>
 <bee6b93d-aa2e-4335-9801-89f02eb3eccc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bee6b93d-aa2e-4335-9801-89f02eb3eccc@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_071356_639588_E8F24F13 
X-CRM114-Status: UNSURE (   9.56  )
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

On Sun, Nov 02, 2025 at 12:11:11PM +0000, Ryan Roberts wrote:
...
> 
> Here's a proposed fix, although I can't get access to a system with BBML2 until 
> tomorrow at the earliest. Guenter, I wonder if you could check that this 
> resolves your issue?

Testing.

Thanks!

Guenter


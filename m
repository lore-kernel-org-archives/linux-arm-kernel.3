Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA83EE642F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 12:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3O3TpszTjN5lebV5+WjJKzq7GLfLUh/ZVEukxFjH0fQ=; b=zMRjSqBEfVNY1lJELuJy6T0Zow
	hxGCE4yrlOCGoQgtNlL1T+AuV6wFp9J7tjCqoGHHcqzT0Q/DxtMzj7JkaMc4m45gtjqX235VufYKj
	4yB1LNAcT4bdxFoIpZqjw7/7YuRh7ZtJz4SlS1uAb0R09DFrm3H4T3qmQIhf4vD4rBe/exxS6x1DB
	t/OJ7dFpN9ngEx3+qMYu4kHMskW1AV3jAmWrsMbRwtUGhyHo+xiiCUeQi+5o0NzTpvXUgYp6QSYKV
	mtbcgqgQJN/nECmsz4/6oIiS4gqEvo3lLK5i07iiUDJ8XHbCaRJTPPchSkXIUpmITl0lULz2qyVm2
	nTqsQuyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavPw-00000005yxn-1G9k;
	Wed, 31 Dec 2025 12:35:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavPu-00000005yxh-2m8i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 12:35:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6826600AA;
	Wed, 31 Dec 2025 12:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662B7C16AAE;
	Wed, 31 Dec 2025 12:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767184505;
	bh=B2M4WvvAxNt5x1M84qRGbik/E/Gxr7wlXrZRggc2PAc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pf6LIZSx6Ze7BTQt6bjPYs+oIBAP8LGmLSf/UCB+uZUS3xPmdRiSt3fPX/FutRGdy
	 Sbo6GXAMPIghiN84OFmXqKFpg6QAWSeMLQVWLa02mdu1NhKY+rCc0aP+z4t+4qVKVc
	 ESF1+ovbuEE9T+bsVUPf1kRnegeFwYrFTlXkLd7/J6Q+2YoGikUIYYnWl4IrC3rJQG
	 H1Vr7bM7t9f17grPGX+FVNBv3WFtSxDagLFaCVKKqiHWucp9G7m1HSvrhIoH/N8ZrM
	 1EbuiKZNYpZBs8MkHZ9Ex2QqHTH528ABYAzTtPsyH9UV+GwhnuXEGeLBUimCvw6WNf
	 vhjhxPGx38V9g==
Message-ID: <d99b100b-0262-4f57-aadb-c16fea47e6cc@kernel.org>
Date: Wed, 31 Dec 2025 13:34:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] fix wrong usage of memory allocation APIs under
 PREEMPT_RT in arm64
To: Yeoreum Yun <yeoreum.yun@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, ryan.roberts@arm.com, akpm@linux-foundation.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com, dev.jain@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 lorenzo.stoakes@oracle.com, ardb@kernel.org, jackmanb@google.com,
 vbabka@suse.cz, mhocko@suse.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
References: <20251218194750.395301-1-yeoreum.yun@arm.com>
 <aVT15bhN4hEBNaOg@e129823.arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <aVT15bhN4hEBNaOg@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 12/31/25 11:07, Yeoreum Yun wrote:
> Gentle ping in case of forgotten.

A lot of people (including me, wait, why am I reading mails ;) ) are 
currently out, and will likely be out for the remainder of the week.

I'd assume people will look into it next week.

-- 
Cheers

David


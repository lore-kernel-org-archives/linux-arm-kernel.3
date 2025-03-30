Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F8AC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 20:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQdIPIBIFPsMXzbqA6bIdMRDw0puL1K2JM/M9dMbXWQ=; b=hrpCKi0vCB+UfAajwhzBfmJa2c
	WM/OCzeA8ZFrs5zo4pXCGMqBpgQddIFX8fs6T64gq79+JReoKq4zgAPFRrEU03S8gdbGKEkfZlPkd
	mAinOecay07PUoTmT8GXaMr/034GCtLudUVwyVdl7Se/8pqEYHmYJCFXnEg5PS5NjxBqioWsB3xVf
	ME+B/YZigxQex0GHytjkmpesqTK3ZxP8xXkVnAY8lOoC0Vz2V8xK6HnlOcc3IEnH+oiMO7vUCV+EC
	5jUbM18r2vTaDf+6nsjtQ5QUatxCuyU6qxUVObtJGBovh5oKv+JBYYcu4fMequIKvnzqMNI7+kCCo
	lBaN7SWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyyzY-0000000GddN-3AM5;
	Sun, 30 Mar 2025 20:10:48 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyyxo-0000000GdVg-0e89
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 20:09:01 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so7244071a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Mar 2025 13:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743365338; x=1743970138; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FQdIPIBIFPsMXzbqA6bIdMRDw0puL1K2JM/M9dMbXWQ=;
        b=Z2c42Qab+bvMd6RlVDgpa8JjPF/ndEPDdoe438cqMM7AdGeVyfFCRb339czyB88hbm
         U1aPZEkL8vH5Bosz8TrL6kqWqkr4MBhG2MpNcZDSW0D7i7NAGIEhfcCWnRa0yye3r/YO
         seiOqXhHVd9WNxkokuEitzJuHOZNQ5A0CgLsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743365338; x=1743970138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQdIPIBIFPsMXzbqA6bIdMRDw0puL1K2JM/M9dMbXWQ=;
        b=Xyg4sC8LJg0aC8XWFYtgCbt8XhbTpeKNckxJQLByNKy0xTGOC5gQncRVEADNpkP7s8
         zpE+MoSlKP92QT0sBDjxRsjmMqP8CM+zB2YEVvT0wUUs8cBwPgFjmejDfz2iJ+kPYy+Z
         aWMM58JvJbHLrGD1fsIABfD2mv/aZegTMMXYQdEfvLMQ1k0FzG6FSLbrI6vxzlkBxBGi
         shLBDLdt71FbZgBu6k2QzSILEtDk41chj9O2aDEFxCmYg+Kf+VLv2fnAzUVYq17DuFm2
         c1rm9amRtzNIQPkB2HkZ9SHJVJOuCSTlRvG6IoknbiE1azhdkw9P2oRZtaIxjMmDnG9S
         F+8g==
X-Forwarded-Encrypted: i=1; AJvYcCVEKH7QyWjhreDRGgwQsYCNLZ9yrVXV7oBi1epATx2s9SFKY0f+SDjMZ5ue6RnjWGixcYtFun3Gc21M0rcJ1Ece@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4sqDOn85XxaalbZkNOre7Ur3Y6xZlKVJ3CISi2xJTGqW1RPdK
	rd0mp/N5tfU/HOgPgmkW6nEIxxgmQ0GLyf7pMAzmVSC8ueHuRLtNwtq+o9NKL5jAcALtDnlVnDH
	leAo=
X-Gm-Gg: ASbGncuEyGTTfyiIjmk2VkFRVgzS35xxrS+V1BSsPqiff09Iqk10Hs5bCmldmpIsgi+
	u/r1/vTKMrLnzVIAd+RZkW+UFnxy6duIHuLDsxM0npjOYZY1HtGVvUC5VJPB/GITNlTLDer/SHA
	ZsQA1bT1f2r9Qy9WXzNfajRK6Hr8LbzX7YhENa0R+2aDDhSi7WMYOiKz44QqsMVhBPC2YdmlfdX
	djzsgYsXCD2rtQ/dNH1H2VtErDad07MDQxtkP63leeFiCSOKSFm0chQEPALpJ2rRNRO4TfsL68j
	jJrfrWCzbeT60WFz/2H3KCKfY8qPKbYvwZhHff5B5fc7jkulW1Aeiqjutt057/EMd7fay+IlqVg
	WPKndUWCo1AvWFskFx7bppMh7xSaozg==
X-Google-Smtp-Source: AGHT+IFUOrdmPU4iJvyAw4Z1ZOkgntfEHfCeG5n4H3+g2skLUSt38337gR9230J7elyAeUiyJTDU6A==
X-Received: by 2002:a05:6402:3584:b0:5db:f423:19c5 with SMTP id 4fb4d7f45d1cf-5edfcbe92d2mr5882838a12.5.1743365337939;
        Sun, 30 Mar 2025 13:08:57 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16d38e3sm4653616a12.24.2025.03.30.13.08.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 13:08:57 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so524408566b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Mar 2025 13:08:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1NzGE0yos5ylZjQnXpD+KTqIQMG1VKsqPU4zlLdjcnLvOyfvfI0nduaOfEZCUfax2Bxmu9UH2UX7ZkgU9+xaD@lists.infradead.org
X-Received: by 2002:a17:907:3da3:b0:ac3:4227:139c with SMTP id
 a640c23a62f3a-ac738a5064dmr549397666b.24.1743365336889; Sun, 30 Mar 2025
 13:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250327144823.99186-1-alexei.starovoitov@gmail.com>
In-Reply-To: <20250327144823.99186-1-alexei.starovoitov@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 30 Mar 2025 13:08:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg+nyd6Cqnw-vVxvVTTW31zOyBOHO0ak1xPFX5C0qut=w@mail.gmail.com>
X-Gm-Features: AQ5f1JqZpY881qm9M5vJvGClsN_VOWkQMfOTIJY-M64XcTRU-qfDU4LkUOiqPUg
Message-ID: <CAHk-=wg+nyd6Cqnw-vVxvVTTW31zOyBOHO0ak1xPFX5C0qut=w@mail.gmail.com>
Subject: Re: [GIT PULL] BPF resilient spin_lock for 6.15
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@kernel.org, peterz@infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_130900_206487_D69D6B8F 
X-CRM114-Status: UNSURE (   9.24  )
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

On Thu, 27 Mar 2025 at 07:48, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> This patch set introduces Resilient Queued Spin Lock (or rqspinlock with
> res_spin_lock() and res_spin_unlock() APIs).

I would have loved to have seen explicit acks from the locking people,
but the code looks fine to me.

And I saw the discussions and I didn't get the feeling that anybody
hated it. Merged.

             Linus


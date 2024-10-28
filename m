Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF200D5B144
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 20:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6nAUNbudPdSaY4ohe22hR7sOvXwfvaldH6jIn/jf/c=; b=sTmswaVJhRvrlq7oWMSorEv4Tu
	tRQRy+xiNKWBLc/qGhu9e5MyoAFHhsLrtK+f8uMF0KDdFMsj+UdnscIKufjmo+fbyy4hS8Vaa7wzK
	9lFWWCXqkN8bINlZswtG1KxwQHb8HWkNZcmRUexvGuVjlYBnFrvKKWn4Qlke9bOizj7pJ2RC8Lh4Z
	XzbXLBZJyt1T+M5q+2wlR8p/WSNfwgZGpl+Gh24RgvHc+GFCq5U6QHH07zKBBAfzMImgrisWDksom
	XuMMr4GmNZWyuRAKeNAtLtFPVX28Gt8e6732OosFDcU+lJLUJjx5AuYcSQ+p8wiEGYMrgvpGpnn4p
	UDk9uGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WHy-0000000C91V-0rAT;
	Mon, 28 Oct 2024 20:24:34 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WGM-0000000C8hG-0ZqG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:22:55 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so6253170e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 13:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1730146972; x=1730751772; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e6nAUNbudPdSaY4ohe22hR7sOvXwfvaldH6jIn/jf/c=;
        b=Ep1U3PnEpCWn4iu8dLjCG/KPfgGqns5njm/jURaEpBwksm9poJyvBbY7pLUaALA46i
         swnVXGDH2Gqk0n6Qwh+pv+So7I8FzBfCiNI0vrzSiV+NcBjl2SGNhKVmzfqG+N8qQbpu
         phi1bBphDpOYig6hU4idgx0D0rwUyC+hhIbig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730146972; x=1730751772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e6nAUNbudPdSaY4ohe22hR7sOvXwfvaldH6jIn/jf/c=;
        b=PK5cfqXLH3PJxa4h4s0Me0bINYp2Kb/wXKef6wvmac0pxJafQueyFACgTgE9pyUUb8
         PfI6VSutpf1DT0aMeRUfb+tbGx+RXBQVbhAKvnSgBtVxlfkQI+umuAoN3KvcLpnAp3Z+
         w0mTlBcqIU1MltK/V06DlMSYxWWht20tbh3TRXzKoiswO55x5fZUOny89Kjq42M/OIcn
         nitufSIQ/P/an9GjQ8MMiuhECtH+yfr+ImnRMIpGS+LyUB4/BsdnHTsE5BxDUCBCQeV5
         Kny7xSLFX94ntz2G2+V2fVow6Rabk/U5mMUDdgTqDvKr+VMVTZa1z1/d4TPgaU5btTWA
         A1Yw==
X-Forwarded-Encrypted: i=1; AJvYcCU4c6+kLd4qvHMXdfijBZMf4ZUr4TxCSAf69SJB2uwuUirkmvQfeDvPpHTF1E0TSQCLHheSt3J9yCg59DLzyXyW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3OLoae9iXahTh97DypT3SHaYtF7QToEGVS08Sr+3PVZ1FeEM3
	3QpAmUGf8aQFMdoRsOmbdfscj6F84wxZeYQ0RHUCDbd3+C21xjtgvliP8IlriiirDSR0vZSPoM4
	jpRGshQ==
X-Google-Smtp-Source: AGHT+IGkyKCGvAzy1IxkqvdsQrpbZjmNQ468L6ICxPZfmCVp6qUldT5FDEquA6CSnl808ojQbL6gtA==
X-Received: by 2002:a05:6512:3b8d:b0:539:8f3c:457c with SMTP id 2adb3069b0e04-53b34c8db3fmr3397215e87.53.1730146972000;
        Mon, 28 Oct 2024 13:22:52 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb6347f20sm3326659a12.86.2024.10.28.13.22.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 13:22:50 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso690243366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 13:22:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQkRUf3iiL1dfX/vNpzbFsb6eiILrRKUHT1n5EH0HWS162VcLCdR8giNa2HdydU4yM4ScEqFyhBu3NG9RWKFN3@lists.infradead.org
X-Received: by 2002:a17:907:3fa7:b0:a9a:8ee:5951 with SMTP id
 a640c23a62f3a-a9de5f4ac2amr729925566b.25.1730146969268; Mon, 28 Oct 2024
 13:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729715266.git.lorenzo.stoakes@oracle.com>
 <6e8deda970b982e1e8ffd876e3cef342c292fbb5.1729715266.git.lorenzo.stoakes@oracle.com>
 <61461dcc-e455-450d-9c01-5465003fc31c@sirena.org.uk> <c24a174d-c8f3-4267-87ae-cf77fa587e82@lucifer.local>
 <CAHk-=whD9MrPwPMBgVG16T_u+my8xYtZg2tUGz932HeodVX7Bg@mail.gmail.com>
 <438f50c5-8b8c-444f-ae85-10e5151f3f24@lucifer.local> <57mgmdx7wgfwci3yo3ggkmcnm3ujamgkwcccm77ypvmer5tegn@opiq3ceh2uvy>
 <ykzmur56ms7fm4midi6tbncjvcvf7ue4lp7e4orblrmwnefw3e@oa3enlpdrcrr> <bea02efe-a695-49e0-b15c-2270a82cadbf@lucifer.local>
In-Reply-To: <bea02efe-a695-49e0-b15c-2270a82cadbf@lucifer.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Oct 2024 10:22:32 -1000
X-Gmail-Original-Message-ID: <CAHk-=whpXVBNvd0NJpw9=FGcuTuThwtfcKeM3Ug=Uk6kpChCPA@mail.gmail.com>
Message-ID: <CAHk-=whpXVBNvd0NJpw9=FGcuTuThwtfcKeM3Ug=Uk6kpChCPA@mail.gmail.com>
Subject: Re: [PATCH hotfix 6.12 v2 4/8] mm: resolve faulty mmap_region() error
 path behaviour
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Mark Brown <broonie@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Peter Xu <peterx@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_132254_218673_C66299C8 
X-CRM114-Status: GOOD (  13.48  )
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

On Mon, 28 Oct 2024 at 10:18, Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> I'm genuinely not opposed to a horrible, awful:
>
> #ifdef CONFIG_ARM64
>         if (file && file->f_ops == shmem_file_operations)
>                 vm_flags |= VM_MTE_ALLOWED;
> #endif
>
> Early in the operation prior to the arch_validate_flags() check.

I would just put it inside the arm64 code itself.

IOW, get rid of the VM_MTE_ALLOWED flag entirely, and just make the
arm64 arch_validate_flags() code do something like

        if (flags & VM_MTE) {
                if (file->f_ops != shmem_file_operations)
                        return false;
        }

and be done with it.

Considering that we only have that horrendous arch_validate_flags()
for two architectures, and that they both just have magical special
cases for MTE-like behavior, I do think that just making it be a hack
inside those functions is the way to go.

              Linus


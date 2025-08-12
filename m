Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD7ECA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 03:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCkvxp64xxUOSuPCfrC7oiW0+5JFJ8BJc57BUtN/nPg=; b=IGqjZBduYcWNY4LvIZXqeMUe2n
	0vkur39+Z4gx/YfJHFjYcyFq4W+ywQpP0id8upmaukuOlIsCxneG619uwpY49430msGKIh4XUy4aO
	qB43PhXsucS8KUDQ6edNw419iea34TZxbNr8sUpovlvFx8Xpn/NlXltK5f95HWNtRlE+KtOCzTMKO
	WWSC9bIxP1E6uzLMXAEVSw59MZM5+hk8lUzPMJTb2iXIZ32MUC65hD8Fe8wK7pRqqqGXxJ+HWMuQl
	db668ErnnHqsy/toGUH7//+67D4HVf+HgVPZkpJV50BIbpR1cuU9ToDZWvzJngAP0W88KYvb5EiN/
	/LhVmpnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulflf-00000009imD-2SiR;
	Tue, 12 Aug 2025 03:33:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfiy-00000009ibD-4Bej
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 03:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754969454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XCkvxp64xxUOSuPCfrC7oiW0+5JFJ8BJc57BUtN/nPg=;
	b=Yntf1LEcgIK+pPuWQmuihuwSsj/FfKcXoF6HaCKoG9P6hC8xcvF5CacdyzQHNeV3Fpa9Pc
	iTW7mGjVceIuKJQAtaw64L0xwTBcjxeOvzrdCZQ/yxuNXcHkV5Y4BlInwAloTCL10N2J/y
	AKBPF6pgFkLynTxy5eXvCeChK8xuoxo=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-EKkKDK2ZO6utt3S9u-oXNg-1; Mon, 11 Aug 2025 23:30:52 -0400
X-MC-Unique: EKkKDK2ZO6utt3S9u-oXNg-1
X-Mimecast-MFC-AGG-ID: EKkKDK2ZO6utt3S9u-oXNg_1754969452
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23fed1492f6so74177385ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 20:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754969452; x=1755574252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCkvxp64xxUOSuPCfrC7oiW0+5JFJ8BJc57BUtN/nPg=;
        b=ITPqXEA8QjRRu035OAe0Fh5NXBCGnR66KQkmfQnWOsTwsvrubrx6uKSplVeG8ImROt
         R0qXQ/7MRWeXMQ7g2rxkYN9nVdZ7QWlTiVsVL9vQU/eTvPNiVJhz2uOHJGI1LPQs/HOP
         7NujzPMI8iZp3Wv3ityl5qPt6rntKQezikYJZwZFBXdZhJhCBygF/LKa2nuWbIBsvPt3
         9CZhfxG6KauHWB1MBChkuDnHBpQMhFmbH4gBRyypWNIWnFsRCcpB2alRsglcJrpKPpQv
         dVsO6DickFZC3SYcgUnjA8fTsTkYB/ql56YtSwfcVGqNJKhkM20ITzBWRYDUPA88llWf
         HkUQ==
X-Gm-Message-State: AOJu0Yz8NmGq8/BdUqbEOHSIUPzhPmbK2uQXA1V1qePO1jT/Fpr5opgi
	I2DfLqjChUbeQLfI2nAyKdo59jpQSzZ63MU0ujUzmV1dHcrqqT71E41HaPc9PBK5P1PAchtm61p
	NneoUf8sPM5aXxIWvfmAIUFCno/qtFY33R0jDSUlfCfZXWubzIx/uRkMeGU8/qvTAR+fLXygp0M
	5K
X-Gm-Gg: ASbGncs01FJMA00+pKIXWXtB9m9f5Ey0WMOYFw2XiwxWe1gkDYN2YEbMUcstz3gwSvO
	W7XJwARGAlj9GjrfQcrleCqFsii9ojzlHl31+K/HFIreptp8zQIR2T+9RDTstfPhKADjbQzgX+E
	MkPrBRkRyd0+TMcVOrn+G6BoMR60Llguqu5TX+8WJBQdHtefZRyPMejrCD9ggRAIblSJdIW+5hA
	9KuZePhfYyt2f/+xI1WqnUtsvr2phkwaaOH2MsFYR7PnbeAtu+qywptZ6SBwl6DiD7/aDlFYibx
	+HsWWrA40m2tDlvVFarGxCWa4HNfzto=
X-Received: by 2002:a17:902:f70f:b0:240:640a:b2e4 with SMTP id d9443c01a7336-242fc3683a8mr27219665ad.49.1754969451802;
        Mon, 11 Aug 2025 20:30:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsNcl0XLPCCner9/NUZ+yEfhqQUGBX8BpPGrFeFAmrdynsST1rXFBZLTyWU5C4N4/jD4ci1Q==
X-Received: by 2002:a17:902:f70f:b0:240:640a:b2e4 with SMTP id d9443c01a7336-242fc3683a8mr27219305ad.49.1754969451410;
        Mon, 11 Aug 2025 20:30:51 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216129c8cfsm16030963a91.34.2025.08.11.20.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 20:30:51 -0700 (PDT)
Date: Tue, 12 Aug 2025 11:29:54 +0800
From: Coiby Xu <coxu@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	kexec@lists.infradead.org
Subject: Re: [Regression] kdump fails to get DHCP address unless booting with
 pci=nomsi or without nr_cpus=1
Message-ID: <ovyxlf7aw4y4bsxlkvjaxd5zs7jw5rnta3gyfmroazesm4m7mi@ebgu3frfd2bb>
References: <x5dwuzyddiasdkxozpjvh3usd7b5zdgim2ancrcbccfjxq7qwn@i6b24w22sy6s>
 <87bjom8106.ffs@tglx>
MIME-Version: 1.0
In-Reply-To: <87bjom8106.ffs@tglx>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nItoI6VHSGFzQMWxxpya3TH6FXjMP3kGTLN8tFJnWtU_1754969452
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_203057_305702_77E4E2BE 
X-CRM114-Status: GOOD (  15.11  )
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

On Mon, Aug 11, 2025 at 03:02:33PM +0200, Thomas Gleixner wrote:
>On Mon, Aug 11 2025 at 11:23, Coiby Xu wrote:
>> Recently I met an issue that on certain virtual machines, the kdump
>> kernel fails to get DHCP IP address most of times starting from
>> 6.11-rc2. git bisection shows commit b5712bf89b4b ("irqchip/gic-v3-its:
>> Provide MSI parent for PCI/MSI[-X]") is the 1st bad commit,
>>
>>      # good: [7d189c77106ed6df09829f7a419e35ada67b2bd0] PCI/MSI: Provide
>>      # MSI_FLAG_PCI_MSI_MASK_PARENT
>>      git bisect good 7d189c77106ed6df09829f7a419e35ada67b2bd0
>>      # good: [48f71d56e2b87839052d2a2ec32fc97a79c3e264] irqchip/gic-v3-its:
>>      # Provide MSI parent infrastructure
>>      git bisect good 48f71d56e2b87839052d2a2ec32fc97a79c3e264
>>      # good: [8c41ccec839c622b2d1be769a95405e4e9a4cb20] irqchip/irq-msi-lib:
>>      # Prepare for PCI MSI/MSIX
>>      git bisect good 8c41ccec839c622b2d1be769a95405e4e9a4cb20
>>      # first bad commit: [b5712bf89b4bbc5bcc9ebde8753ad222f1f68296]
>>      # irqchip/gic-v3-its: Provide MSI parent for PCI/MSI[-X]
>
>There were follow up fixes on this, so isolating this one is not really
>conclusive.
>
>Is the problem still there on v6.16 and v6.17-rc1?

Thanks for the reply! Yes, I can confirm it still happens to
6.16.0-200.fc42.aarch64 and 6.17.0-0.rc1.17.fc43.aarch64.

>
>Thanks,
>
>        tglx
>

-- 
Best regards,
Coiby



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2DBC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 03:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MyI6bQ4VKi6kzEU6MGPeSA2rT56TE5vaJOVAfdMj034=; b=LZbyiGsKM74FQvmOQpxY93IYfJ
	WZB6UwrINrG43xCPqw1aZvzFR2sU0H6p21aUGubIA8P1nSuUymHsiL5x/wu9Giz2D5BdO0EGEqOpH
	IFJ9g4c5t5aTvk3ZUlsHkYigi7ESVtylgg8CwSBdoYZv0AfGMYC9e9xiPbmzaJ9kGGkSBkGrsjbHK
	wp47cxUSCwrngQcJxsH0YrpVEqjGN+6SuK4AMpPzLgrjpgKjGsYXE7qPj7gUZfU1MS5pw7w59wMbj
	BTpqS1LzQCyH1/UOnn+TLTrkCUZXC6EXLI1mq5JEj8m+EL8vDZclriDgRyk+GoZiU15LxvYQFTM20
	kTE0WBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulJa4-00000006Rux-1h0j;
	Mon, 11 Aug 2025 03:52:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulJBz-00000006Pm8-3Gu0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 03:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754882841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=MyI6bQ4VKi6kzEU6MGPeSA2rT56TE5vaJOVAfdMj034=;
	b=N98C2TSFtN91dW1oU7CzirJAkJIDuwmPCmhoCep1fcn8mkbL2ZPXn7Ijgm9UIJXBdjZt/e
	qjLgGajyALv5Yp87rz9HUJyPuDyfMpS3+xp3Eirh2iJ99b32e5WDiasDQVfSk7wOVM0PE0
	tESQtu6okFAMvFyWJU0GHk9p8iEC/1Q=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-L97O6ODIOwy9gl_Bi05fFg-1; Sun, 10 Aug 2025 23:25:52 -0400
X-MC-Unique: L97O6ODIOwy9gl_Bi05fFg-1
X-Mimecast-MFC-AGG-ID: L97O6ODIOwy9gl_Bi05fFg_1754882751
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23fe984fe57so64041385ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 20:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754882751; x=1755487551;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MyI6bQ4VKi6kzEU6MGPeSA2rT56TE5vaJOVAfdMj034=;
        b=bAunr99jLYQjQYF1GV5KjySOz5xSW8MBMXdDJHqltXr8ZqcpWntE6YigKbOpU7bQdJ
         8y7WFwO/hviMLuGoUpdkrFxvpX4qGbljRmNMLgnd0s8fqBTVNX4Tpui6AjOC5WgzhYk6
         xGfWOdRxItvNmRER35M3Z2iH/3UurHEGeHTcJ0NSDxRHyen4576FtLgCXT2/CfTD4NK2
         UAveOfhudMnoRcR0QXztLeNQ1UnGLpjvk8Vgk8dgANrNNKFGD1fi9wHbq+I5MC+NeBJl
         sXgnznshKL3roESSHpAMK0yYGftmEbx0yXr1QsUeu0pVdYhW13NeQ/tHo2NSnTigXirL
         7dig==
X-Gm-Message-State: AOJu0Yz/H76jAlkgy8oqH/mnrPfydqhOqHj4TxLx7oAUMDMdP5Ha8Vql
	4Rc/oBru1NyP/Ff2h499BOLDmHoqULh99HU9mZGvamSjG1tmuNCsy1Y6sem8BNyuR/kSM5Ohqe9
	wuzDEzKTHi7cyjGQw8OsvGch23DXuwW5c+WGcl+cENs+Op5xqAzvk1WvFMh2TDYzwjUs4SpmQSu
	C2
X-Gm-Gg: ASbGnctEKduBgK1MB0VESu9Keb0ieQ7KihUyMCyt6DYNJYSM2IUqy+HLJociIGVU8lI
	loLX206FNHwbxM/1DpChlixr8BqabddDNwA9PLjEUQ4Wxp0bK+AXtlHfJPWnqt14/g+0tykKdO7
	NF/B6cyob1uaSRV+lWyawHAqbcdFTGsa7sYcD2Hu2tApioa2T67QpBDo+eV84YSzblqPjqzq3ZJ
	YiIsFGwpCfrKEgJnLM3YJnRs1mlI58QDyx+uSV5XsSMkD7A5/fe5MjkkjswqiXSYmC0mHYdmfUQ
	tjB7bd8PK3RTegUe2+klVE+CxhiYtWI=
X-Received: by 2002:a17:902:f641:b0:240:7c39:9e25 with SMTP id d9443c01a7336-242c220019amr145851335ad.27.1754882750975;
        Sun, 10 Aug 2025 20:25:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGij+iLLH1kTC74+yPsc/frGl3BwTOOImoH7zdGTiZxVFriyBsG7HIux9tyLkoa+5Pjls7KUw==
X-Received: by 2002:a17:902:f641:b0:240:7c39:9e25 with SMTP id d9443c01a7336-242c220019amr145851095ad.27.1754882750559;
        Sun, 10 Aug 2025 20:25:50 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef6a8fsm258509715ad.23.2025.08.10.20.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 20:25:50 -0700 (PDT)
Date: Mon, 11 Aug 2025 11:23:49 +0800
From: Coiby Xu <coxu@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	kexec@lists.infradead.org
Subject: [Regression] kdump fails to get DHCP address unless booting with
 pci=nomsi or without nr_cpus=1
Message-ID: <x5dwuzyddiasdkxozpjvh3usd7b5zdgim2ancrcbccfjxq7qwn@i6b24w22sy6s>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AdqohfWQZ9hgnajSZLrWkOPsRrT5cXWm8rBuPNdWg74_1754882751
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_202723_879564_CBE6DFA6 
X-CRM114-Status: GOOD (  10.99  )
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

Hi Thomas,

Recently I met an issue that on certain virtual machines, the kdump
kernel fails to get DHCP IP address most of times starting from
6.11-rc2. git bisection shows commit b5712bf89b4b ("irqchip/gic-v3-its:
Provide MSI parent for PCI/MSI[-X]") is the 1st bad commit,

     # good: [7d189c77106ed6df09829f7a419e35ada67b2bd0] PCI/MSI: Provide
     # MSI_FLAG_PCI_MSI_MASK_PARENT
     git bisect good 7d189c77106ed6df09829f7a419e35ada67b2bd0
     # good: [48f71d56e2b87839052d2a2ec32fc97a79c3e264] irqchip/gic-v3-its:
     # Provide MSI parent infrastructure
     git bisect good 48f71d56e2b87839052d2a2ec32fc97a79c3e264
     # good: [8c41ccec839c622b2d1be769a95405e4e9a4cb20] irqchip/irq-msi-lib:
     # Prepare for PCI MSI/MSIX
     git bisect good 8c41ccec839c622b2d1be769a95405e4e9a4cb20
     # first bad commit: [b5712bf89b4bbc5bcc9ebde8753ad222f1f68296]
     # irqchip/gic-v3-its: Provide MSI parent for PCI/MSI[-X]


I'll appreciate it you can provide any suggestion on fixing this issue.
And I'd be glad to verify any idea as this issue can seem to be reliably
reproduced only on certain machines.

The aarch64 kdump kernel on Fedora is booted wit "irqpoll nr_cpus=1
reset_devices cgroup_disable=memory udev.children-max=2 panic=10
swiotlb=noforce novmcoredd cma=0 hugetlb_cma=0". Removing "nr_cpus=1" or
"adding pci=nomsi" can make this issue disappear. 

Note I've also reported this issue to
https://bugzilla.kernel.org/show_bug.cgi?id=220328

-- 
Best regards,
Coiby



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1540C0219A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 21:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4NeFOJmhxb0HadgLbXrVb+Dqs0SXVQJ1rxhMk6r+zU=; b=FSbLu38zxAc9Eb3riQCBCEoBCP
	xCsbhHVbsIpE6fpXJDXZVmb6Xok/4hCJ6j/FlKPvHMQ3V7zAvUB9MUD4cRj7igMeg6x0ZxU1//McX
	YQNodOe1+54eYzW4+YJbRGAoS1RD8QUYpAuFyTfH9gEfjsXwM8F3Efe3QBmGNcPZqsyfwhLVb5F6a
	d3QmNy8mSRhPsWGtOg4twIKFL7/pIev9TB9IijluXXYykjecc1Y6zUGw8UW0UKqDuV9u8uVOWV41O
	VxbXaZtX1c5LTU9WTz3i0USbKnkgL1AUzLngav5Gpj1xour0fsyfEDEmVhczdWz4b39PvF6gTfF8Q
	qEa83CTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQH4-00000001ZEW-1QPN;
	Tue, 04 Feb 2025 21:16:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMzB-0000000190R-1z6r
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Feb 2025 17:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C4NeFOJmhxb0HadgLbXrVb+Dqs0SXVQJ1rxhMk6r+zU=; b=dtDo3Ns6+q73aNq7ZsMZc/Asmm
	X9Na3Y08bh6WrZosT5CLipOsQUi/I+foBOMbDIWvCK0h7AwmKTsJyL08V33z7EKnokRz13jTRKzNk
	ZK42dSMAUHHDtRCUlonZ2fWnLT7a0Z5x2rnINsoXwvfMmdPs6ZakjE1kz+E1IFbF4KfssWpCEvAyO
	HwUrAVq4vAmUxbJY492b9ljpDTgdMJt0YcdtjmAjoT3NAUsD4mgV0q0otDn8N/vc+pj3tFD/kySbq
	ZPS2ksJpBrnxlDCJ0d4h5p3B+/PAQgyNou82z9x4QmtnxLW4r5lhbLosMqLONuxFF71iKWtfmJtFB
	lWnQATcQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMz8-0000000GMXX-0dY3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 17:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738691115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C4NeFOJmhxb0HadgLbXrVb+Dqs0SXVQJ1rxhMk6r+zU=;
	b=XKXzt88jAkinEKZNN+bmZUjc9XPgnei4EAe9suOqrECwAOwmt40YKVpINOmHqjHhNcb/29
	P6qsamj1I9lSW32x4J//tWN2FSisUQEIo8XVYN5kvkVtfWjTisRltkZwY6kp+atxWV63r5
	cSOmInDpIwDjGVQIF5AskW06icdVDAo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738691115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C4NeFOJmhxb0HadgLbXrVb+Dqs0SXVQJ1rxhMk6r+zU=;
	b=XKXzt88jAkinEKZNN+bmZUjc9XPgnei4EAe9suOqrECwAOwmt40YKVpINOmHqjHhNcb/29
	P6qsamj1I9lSW32x4J//tWN2FSisUQEIo8XVYN5kvkVtfWjTisRltkZwY6kp+atxWV63r5
	cSOmInDpIwDjGVQIF5AskW06icdVDAo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-vplwOFqgPM-tNiIyLffFgA-1; Tue, 04 Feb 2025 12:42:11 -0500
X-MC-Unique: vplwOFqgPM-tNiIyLffFgA-1
X-Mimecast-MFC-AGG-ID: vplwOFqgPM-tNiIyLffFgA
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467905ab1bbso52810051cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 09:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690931; x=1739295731;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4NeFOJmhxb0HadgLbXrVb+Dqs0SXVQJ1rxhMk6r+zU=;
        b=WKabpO52Kigkd/mG8ssGQvJwoFU+vYp66LvjvabiNai6Vdk7dPckHIC1hiqBea7uL9
         VmdCfc5vLlFkdTcSIfSm4PAXQwkQzMTn4wTTW7xr6QLu1lwZTermvsahyg9AJaU8JjV4
         nRyJiuGutoRshW9AD+7VMjQwVlTYRHfcyp8ymLSLCxTjVe+siMYRkGJv6nhiLrqWqVZu
         J+EUJ/FQ7ArOfn7MHm6xG348MtMeJJBF2xf/KOpqgyp9JIa1XZdcuIAiGIndvEL4PtaC
         CHwdDAT9zP8RuX/NjHYacjff3jTJvATNyas4JGY9FikhPuJFaMwMfJk2j+Fa+vI3ZxUD
         qySQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj+yjXF2kYhncX5OrzpIgH+f1gT4hqkFr1oSvVu5xeDLjf8zSHPn5ZbcYqSoJE30qhvO6DOWnyqyuAwv5CFf2/@lists.infradead.org
X-Gm-Message-State: AOJu0YzlF6AecCgpaCt3hLpnJcD3lWMy7JbCmCMLwkvoi7ZvmLfZr35s
	soPE4tiU1JQ9zQQ9jg6Tp+QXJOsCBbzPks+2D2tfHoZINX6Dm2BORM2mh1KPXV47mYZEgdW4egC
	QAUErlZ6VTz+1DwehlNpLOWa3xyteEZlN2svPoXObNpetvRlRb2EX3vJC1OuVC3vsnaiI8KiC
X-Gm-Gg: ASbGncv10mxgo+Qp+zmJvPAv5SHFwG6tMHhB7/EBhjtst1H7Dh9GPp86EZYHa1vZGDW
	7cNnotliGFwW+lJVOIWMl7SYzO4jryBi8siA131/CCFrIGBjE4a0UKhLulKp+5v0TyIVIh8LwnC
	xFoUKOO7cnuoGnuuTMEJtjniX6/38wwtGecc3x6X5Kbcl4kljabashj2AoLuhVoFvWfEmrv3Q+1
	ESxx7bJKQ4YZ8KXHCAonGLidEjLOQcq+ajpOtU6d7LavV3wHQDFopGC0z0JrMnm1w4+HRrxTpCk
	boMXJhGBLc8Ay3bN3h1V2Hw5ywzThGTwv4AXeLQdviLFYpFI5EYf8g==
X-Received: by 2002:ac8:5794:0:b0:467:7fbf:d115 with SMTP id d75a77b69052e-46fd0a6c343mr368814521cf.12.1738690931443;
        Tue, 04 Feb 2025 09:42:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnrxHtljGCWfirB5phvdvRvD1W53cyjXxbXjd79D0P4Hi/IOz77ZQTfITQwFUokPOGeRBSzw==
X-Received: by 2002:ac8:5794:0:b0:467:7fbf:d115 with SMTP id d75a77b69052e-46fd0a6c343mr368814271cf.12.1738690931098;
        Tue, 04 Feb 2025 09:42:11 -0800 (PST)
Received: from rh (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0c7191sm62333371cf.21.2025.02.04.09.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:42:10 -0800 (PST)
Date: Tue, 4 Feb 2025 18:42:04 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>
cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
    kvmarm@lists.linux.dev, oliver.upton@linux.dev, catalin.marinas@arm.com, 
    will@kernel.org, mark.rutland@arm.com, Cornelia Huck <cohuck@redhat.com>, 
    eric.auger@redhat.com, yuzenghui@huawei.com, wangzhou1@hisilicon.com, 
    jiangkunkun@huawei.com, jonathan.cameron@huawei.com, 
    anthony.jebson@huawei.com, linux-arm-kernel@lists.infradead.org, 
    linuxarm@huawei.com
Subject: Re: [PATCH v5 0/4] KVM: arm64: Errata management for VM Live
 migration
In-Reply-To: <8634gtvdmi.wl-maz@kernel.org>
Message-ID: <f42ee0db-645a-8710-d611-8e45c4e1a4e4@redhat.com>
References: <20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com> <76172c57-aac6-d540-5b98-8de100c0886c@redhat.com> <8634gtvdmi.wl-maz@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uBjpBwF7ihm-idKdDaiuhTAThOgWm8f-VDl5Gmvf_f8_1738690931
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_174518_450406_F2B3262D 
X-CRM114-Status: GOOD (  12.55  )
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

On Tue, 4 Feb 2025, Marc Zyngier wrote:
> On Tue, 04 Feb 2025 16:45:38 +0000,
> Sebastian Ott <sebott@redhat.com> wrote:
>>
>> Hey,
>>
>> On Fri, 24 Jan 2025, Shameer Kolothum wrote:
>>> On ARM64 platforms most of the errata workarounds are based on CPU
>>> MIDR/REVIDR values and a number of these workarounds need to be
>>> implemented by the Guest kernel as well. This creates a problem when
>>> Guest needs to be migrated to a platform that differs in these
>>> MIDR/REVIDR values even if the VMM can come up with a common minimum
>>> feature list for the Guest using the recently introduced "Writable
>>> ID registers" support.
>>
>> Currently MIDR/REVIDR are still RO and guest access is not trapped - so
>> even with the errata management patches in place the guest state would
>> change and a migration (between hosts that differ in these regs) would
>> not be possible. Are there any plans to allow to actually change these?
>
> Sure thing. We only need a victim! :)

;-) Nice. I'll hack smth up then.

Sebastian



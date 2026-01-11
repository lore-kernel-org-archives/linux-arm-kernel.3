Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A58D25031
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 23:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zv21RsZEoVv+G7aoKZTUN2Xu41JrxyNGBt1z4w/tEmo=; b=EtnenVP7Iz3qiJGKVCi6CyZkkn
	/OEgBSIIrK5aDuGS3fqnTwkQEPmqlVrfDpvBwYXchSnteQ2rjfi4ioTBPM1uJAMIJQdMNodYf5mGK
	CWprMxvim9toZyP5B/Di7TXNIOJeYAy3DmxzoqK0rRjzdGm0h+QAMFdYvC+TTw0/gcYap6m6NFBlV
	EhAWCJXwg4nFL1pVk+KKywnHFWxD5A5nfyRHzyeKjeeM/e/hXPWEb4A+UZyUTsxMxX04HEiz6LSPx
	7nc42LbVbbk83bvVo/XOSnxFUwlYQq/JTNGp9Qz6Rqf7sNgng3O5/e8HfWut2ENWEcl2Y/m/H0y3B
	g3KLvZ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf4S4-00000004YdK-0e6L;
	Sun, 11 Jan 2026 23:02:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf4S1-00000004Ycx-0bCk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 23:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768172541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zv21RsZEoVv+G7aoKZTUN2Xu41JrxyNGBt1z4w/tEmo=;
	b=gvcWx2qBeaBpfrCGLp4n5hrOFo7lnuIZQbHXJ3xEE4+cr3Epe2uvJW2xEILw+qP7Tvy9Pw
	CY43OKHlbv3hMrE10RHlvgTLvSPkNSvORRW6IXilgxSj5YK3jDFdqX/j4fKsihP2JzCciw
	1HB+Y2mg3RnLMYA85bAU4Yjvw4ssEtw=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-lXXn3UHPM96aTjv0bIA6vQ-1; Sun, 11 Jan 2026 18:02:19 -0500
X-MC-Unique: lXXn3UHPM96aTjv0bIA6vQ-1
X-Mimecast-MFC-AGG-ID: lXXn3UHPM96aTjv0bIA6vQ_1768172539
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56366dab014so6048942e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 15:02:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768172539; x=1768777339;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zv21RsZEoVv+G7aoKZTUN2Xu41JrxyNGBt1z4w/tEmo=;
        b=DZ6lH/qtR1DxVg5o4RmbJ+ATpSUkWL6VPpP0yMwTmN8hphy90NRJab68TxX4SbZ1rU
         B0wFJ1sEumh+rjEh7XXD5bEnMw5zlNAQFPcWVDR3j4BNdX/j4xUuQahzs95aQCa2AntC
         gTFXYUfUjti+hDs8ktt6bi3f3UzgZSeC/eDwprKbPwiHYglIJdBlFLouZCcD4SPUk8qu
         k8ZLtfPwyXyIKUC+M1Q6rpb6ISYqn7upiS6IF7yY5wCocCUDv7JWvItmbHBwtBbRVE/R
         yk9H8MX+9Fyzd8NQL+BmsK8mYgINtiQgSCBz/maop3eZXxK/SLNPn2ghxBuB3Gq7P+lc
         J2SA==
X-Forwarded-Encrypted: i=1; AJvYcCVEybtboIyWBKvbzStlv+nfc+EOllogK0CGWdGmVdRtY5tAm30rRZF+spnQCCNdguq/dN/vGWy1vBGHDQHcLSZ+@lists.infradead.org
X-Gm-Message-State: AOJu0YwGFF8yP2TM3X4X8QynlvPM+F4DEi408hcnfhmlhJIQVAq5Bii+
	oaurbJGXQwFjRSdBWIMrjiRZlU0ademFcBSlkGtqNqHGz/whafSWsTf/9k59akNUFJB3yyoBfpJ
	p1Ul+88oNWPjaaFGdPB5JDP5ZP9/1yvbzi6aaJrR36nk1s2moCLhxoo351JNvxDw7sih6bAalsn
	FU
X-Gm-Gg: AY/fxX7VFEjlzYnZZ/lpwehgBNNOXk33SuQFV0p7uOAHMo+60wDZc5H3g1HOiHCFHf8
	MGsIp83ikEcAASw1fZ6nl/1OWrxx+d58YY1ROAm/PryZlVphbqYdW+XSbHXwNOHuKkq1mGGrRnk
	AK5lhz0XwiKeaZyrsYbj+PFq4rHGu/yEwZFufO1oy575q2+mr3O8TUl7wjjrYkdYoFlLhGi0+DF
	Yaa/kCS+tV0wIOhR2+nm9sECHwGJBXRfyUlhl5QRhfy65EEwtB5GGuTAoFToV9QdPC0PHEwAQIi
	gfBR3UElKh+WnXAjPlv1RmgTSgHFVPNPk0BQdgT4Qenw89/w72ZtiiKibE61cvdyMUib9PltNt1
	o+rpbeSwcSpG1Y2ycudbBjeLUC8FNtzvfHdAh3H0cWgQOGFsXWLwXB0tS
X-Received: by 2002:a05:6122:3383:b0:55e:82c3:e1fb with SMTP id 71dfb90a1353d-563466b1471mr6262653e0c.10.1768172538994;
        Sun, 11 Jan 2026 15:02:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOk4sm334yhP3hW+Z5bab2iMBbiknbbF0VXPQa3QhngNtcACSCZZbMFOiVkS2ufPcqrvXiIA==
X-Received: by 2002:a05:6122:3383:b0:55e:82c3:e1fb with SMTP id 71dfb90a1353d-563466b1471mr6262646e0c.10.1768172538549;
        Sun, 11 Jan 2026 15:02:18 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5638821427dsm850204e0c.18.2026.01.11.15.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 15:02:18 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <40cec799-f363-4642-969b-24f5a2d56dfb@redhat.com>
Date: Sun, 11 Jan 2026 18:02:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/gic-v3-its: Don't acquire rt_spin_lock in
 allocate_vpe_l1_table()
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
References: <20260107215353.75612-1-longman@redhat.com>
 <864iowmrx6.wl-maz@kernel.org> <87ms2nsqju.ffs@tglx>
 <86wm1qlq7l.wl-maz@kernel.org> <87ecnwij44.ffs@tglx>
 <86v7h8l9ht.wl-maz@kernel.org>
In-Reply-To: <86v7h8l9ht.wl-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Lao-cYBFNdG1n2ncEAbZr60ZAc34IDoEVNftfuqojSw_1768172539
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_150225_265667_EB645D69 
X-CRM114-Status: GOOD (  10.82  )
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

On 1/11/26 5:38 AM, Marc Zyngier wrote:
>> Also that patch seems to be incomplete because there is another
>> allocation further down in allocate_vpe_l1_table()....
> Yeah, I wondered why page allocation wasn't affected by this issue,
> but didn't try to find out.

The use of GFP_ATOMIC flag in the page allocation request may help it to 
dip into the reserved area and avoid taking any spinlock. In my own 
test, just removing the kzalloc() call is enough to avoid any invalid 
context warning. In the page allocation code, there is a zone lock and a 
per_cpu_pages lock. They were not acquired in my particular test case, 
though further investigation may be needed to make sure it is really safe.

Cheers,
Longman




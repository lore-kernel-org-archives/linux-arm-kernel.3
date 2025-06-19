Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952E6C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 01:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFJAbnmipeJwNloKOstVWAEzz4JfWsiupTDJwINriZo=; b=VCGFvhnwIz7quikHo+KkxDOqas
	bH4AQCXqNjaXPNOXnlXO7E/OAn2zRLMHGQUAA4qH0Q+HFu8csPS8P4kFQogFSX0oCfjHzIunxO+Vt
	bmgGqth7CcFuMqI7fB+0TUTh+SLr5Oh4QueZf9LwiYeRkzAf2YOOXGumpLRC0TJ4fz8AWOiMDd+Af
	hK0LxnS6hBC2fl1nh3+5tHRIsL1rxwGBBxIA3jJ1grOOujWakK0AGdu1iaVOIZXWXMUHtnAGy+WEM
	x9UdnEUZRuTiKTISad1hHvJwWCKBWJSVOpAuW8Yu0TaZV/fO4ojwj42x51QlOxGQ7x+q3joC7zYhm
	kllM3kGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS45v-0000000BkTu-2C7N;
	Thu, 19 Jun 2025 01:29:35 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS43h-0000000BkFp-3LR7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 01:27:18 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-234906c5e29so4299145ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 18:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750296437; x=1750901237; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFJAbnmipeJwNloKOstVWAEzz4JfWsiupTDJwINriZo=;
        b=WfcRvrVi1rxMdiiwbBSjl6RFllr0Taw7tNmmoUYEodeV8hA+P+iFLUpbSpAN8T3TD4
         yHVj8GeyJGtV1nG9NN/TjOFdHAWvlsATfQpVkDyv7JpFzG14Ru4JU8lwNSQjJTW7jRNv
         Euuo8DG4fQ4Kc+xVn9JS3ApYisFWc8cBTbbMJQapknjbtxg684MqB4gYHilRMVdksXmK
         rKqoeanH/sxQ+6D28o91HPvZ1BjDCCYoZ+CL+Axwr8G0n/5AuC14HKKDFfSEooNpK83b
         Ny186nPLD9CdRMBKOM8MW8C5RAqPW9H7+NLjRBA6Fh48aP9m++zE24+Mh95jLZPa0PTw
         baIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750296437; x=1750901237;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFJAbnmipeJwNloKOstVWAEzz4JfWsiupTDJwINriZo=;
        b=SmTgKHppCEjVSbzbLzqo99qihzVSxW3tCdwZivVx/YzBgaBeKk/8pHPCOpHHWyJWyb
         JpMQHkKLiC8B5/Kxch/6jZegeiLvIYlaDvjtknHfZm4SPGTWkDfAUC0xyXHPa6jxujy9
         jc3jn8DCl6e6oIvWPgyroo45rFPXr/dBY/rE3VuWM3SfTzI16HebfHotdg+V9OaD8IXd
         98FR/NhO8fHBOrCG4+9wJjurEf72SPDv8kfOCpU+j2as/+oJ0VhBypDQUGFQiNqtetKI
         UYosI3TohFxotWMntV633lh5IYlwbVp/cWh8ovEiSbGq9rXcNFbrPGyJDNFZv+Ltlwr6
         1Obw==
X-Forwarded-Encrypted: i=1; AJvYcCU8edj042vAFN7+RE21ub722Ne70zOia7lKylGlmhlRyJueS28K3c+bP2Am8rUlT0d2K34SWqB/v1srrdY1uzBW@lists.infradead.org
X-Gm-Message-State: AOJu0YwIOkeW8VxMui/mH8TG2Wh6eWnahnhWcQignvgHJ0FHfO+k0GlY
	pjfYPhdIDrQmgINx9dwXYsHcQWEthfzZ74R2d4kuAcSyInZE2Z0+LBKvfWNJIMF+pzTGQdYXNK5
	Ea/AZLQ==
X-Google-Smtp-Source: AGHT+IHfYw3saIGenxdx6hofcNW6m39z+U7j5TjuceZidjPioll6tGDxZ6q1q2NRMsSKefNry3vZpYE+zns=
X-Received: from pgnr29.prod.google.com ([2002:a63:8f5d:0:b0:b1f:dd75:de2a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1ac4:b0:234:9fea:ec5f
 with SMTP id d9443c01a7336-2366afd3a91mr304909275ad.1.1750296436711; Wed, 18
 Jun 2025 18:27:16 -0700 (PDT)
Date: Wed, 18 Jun 2025 18:27:15 -0700
In-Reply-To: <aFNBCaLEdABfybmd@linux.dev>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-5-jthoughton@google.com> <aFMWQ5_zMXGTCE98@linux.dev>
 <aFMh51vXbTNCf9mv@google.com> <aFNBCaLEdABfybmd@linux.dev>
Message-ID: <aFNnc1hZEWcU0Nh_@google.com>
Subject: Re: [PATCH v3 04/15] KVM: Add common infrastructure for KVM Userfaults
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: James Houghton <jthoughton@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_182717_840291_AB18C707 
X-CRM114-Status: GOOD (  14.69  )
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

On Wed, Jun 18, 2025, Oliver Upton wrote:
> On Wed, Jun 18, 2025 at 01:33:17PM -0700, Sean Christopherson wrote:
> > On Wed, Jun 18, 2025, Oliver Upton wrote:
> > And this path is other motiviation for returning a boolean.  To me, return "success"
> > when a uaccess fails looks all kinds of wrong:
> > 
> > 	if (__get_user(chunk, user_chunk))
> > 		return 0;
> 
> Yeah, that's gross. Although I would imagine we want to express
> "failure" here, game over, out to userspace for resolution. So maybe:
> 
> 	if (__get_user(chunk, user_chunk))
> 		return -EFAULT;

I toyed with that idea too, but if kvm_do_userfault() returns a value, that it
bugs me to no end that the callers blindly convert all failures to -EFAULT.  To
avoid that, callers would have to be:

	r = kvm_do_userfault(vcpu, &fault);
	if (r)
		return r;

And that just annoyed me. :-)  But I'm a-ok with that direction if that's
preferrable to the boolean return.


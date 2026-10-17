Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88783CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 15:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBiNZFwCvoEsAVFQ+85lVVDF8nZW55yFDyjuRN5OJEE=; b=QcqXssQQgtbG6helNTFH9Car6g
	qT20HXUrN8DvOT5VXNSvba9WWaZIFgiv7kfh3rGRS0CxG8IzsllGuvGkJBw7eAsKJXK7TlyUZm2x7
	ZoWMJtWtzfaFBO5agLJ7+ChzgRvPhE5X7o4GX33N/eldRmlOAw/jykbIGJReRkShJTIa81LkPCkyc
	ymZtsgtfwmF0ppPAB40d7uuJqwe0BHdRlzViSXJT0+Xng5/AYmHboxePDa9nHCWftAG/WNzyc+oez
	sDzBhJKmJEMfq3KNKB8g8BzpRsFZGilUqC0v4uSvp4AeV7asXQt2PlRC6rjxSIIZ03NM8x/QvVdiE
	rqZpeh0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI6Hh-00000004sW0-3qr1;
	Sat, 17 Oct 2026 15:25:21 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI6He-00000004sUn-0K2c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 15:25:20 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-535199ac562so7624951cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 08:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792250716; cv=none;
        d=google.com; s=arc-20260327;
        b=n9vP813ouffhsKzCkZascjMPK6LmfiIfsLPyvKQ4s3FUwTUi3QL4zVGqFptut0ziKe
         oYlbtMkTWJxjfJ6I3pY0uDffRWFbr9QbE4IgM4osbs1h++GBhIwt0vjAq/8HmtButa2P
         kjvdg/R7+5y32Yu0qOwrp2ZNgIdUMhQO6GaWWkOQRYLA0hys7bQ0kTyceiizZb4rQq5U
         JSCQmXy2BhmBJ7hA9LgkqS6MRkASDArR5nnUoeMMX3KVGqC+QL0jTd6fXJDlOXbY7/1Y
         R5IVvKoofIm+6M/z3hUBblDsw7xrtfYTrfdXG1qc9pWQFY/hmoEcBLxlCjoLURhcLRcr
         wzhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cBiNZFwCvoEsAVFQ+85lVVDF8nZW55yFDyjuRN5OJEE=;
        fh=bIQNGy4wuRQg9UK8aUCcdDKWiXJBPPHc90YkDNJ0h3E=;
        b=dMBEXTeYgtckzYFjxkfkEn4uQy3nKrSpjb6jTQb/kXedRkY8i73nE0FlXVZT8irSjG
         KYL3OGcL4t0qR+KJGreLJ3yRpftdwDxXYJlVXzDr+EvDQB7ckh/7bqtxjpKTNch3/d1y
         RnrIDrD3nX18VcjXxsNT1WLO9rAYCMQi92sq5IX4gNtDbwjpydGzblAquEJPY4keBsCy
         JeZ6O0wxCMSl+54gadoNnt7yMZIYb4uOpS521/N6wD5yBV9htkcPUr5aGE6440YZTuTi
         VNFNDX7xZExmQVKl7t2WywYJdToM9lO0JG73gKM0UbgJ1EtD0V2ph/eZI0c4cUj+FDuz
         RbSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792250716; x=1792855516; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBiNZFwCvoEsAVFQ+85lVVDF8nZW55yFDyjuRN5OJEE=;
        b=PTznQW5bFH1/LSLOqaDPxujZM02lhDU0K9RB/voeKTNOKxJMGykq3wZ5mpMWUEExem
         eHQTowGQrIVQUzamMpGoYFzVmdgQNxnlrO+S/OeGPH/werUTl0Oy6KfQ3ACRF0qrUtLt
         GFXL9YW2UxQMjeVCCAeQcyjbnxIE9EdSKz5zHtIrMT3bZg1Rha50VGFDhzfC5F3qVqFK
         acEAWVxGv5jYOPDJDLCE1XMBWPD2bp6urRLUJ9Netsba6e89BQsADLzyK/JTIpYFSomu
         s3inpyhK5ig6j1kK2zQDfSQ6zPsvF6KQ5/VbaYZipydU9cL007HKZfATta2kG2ZA8+sn
         xbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792250716; x=1792855516;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cBiNZFwCvoEsAVFQ+85lVVDF8nZW55yFDyjuRN5OJEE=;
        b=tvw5KhR00EazOUjmHd4TTiSa6WEG7URyZb4dxpTNsRU6VakjC0LbGaMakYkoEflYEh
         H4mOqkTMUqF/M5k9Erv42DuKyOjReR9Oa6Pta24rrRS1KHt9ohBWw+a8S2QkHWaS5BaE
         Z0Q8Qsvdptt/ZBEOEEy6GDwKaYUofka2I3XstujNCkgJABfxD8JZF41xzVUeGZNnjJOp
         ZPw2IsyP5QyW0Nd5TdIzLrS75eo9Brn1qNF+mol0eUN+j9NE7IoLf5ZQB8pFqVXYtCSI
         NhR9BxSdiP/ZxGx9mox3sBsEFVir33rvBFnSzSZQgb++EpdR0XryKHAmXvwsrZtLFAeh
         kwGA==
X-Forwarded-Encrypted: i=1; AKwUvBxjh7z+CTCdGLg1C0cwce3eubvGyTuUyNYI/Lic6/jzeQJzAwhb3fBKmxJAWSzqm/urWPVNfKU800CsXt5rxQgb@lists.infradead.org
X-Gm-Message-State: AFq9FYJnd8i+TD8n1D01IcLegBM9xfFOoYoYWsu48xQTMWQoKfc8aCRK
	4WkEVZ6UCVTRTgJi6jwtzq5oV7LxFKGGuB25mNkQF6gNMVQd8ob4aw7zja7U8CbORTy5N9FohEU
	zzZFanvU+GAJaIJdv5G+pM+snkNVj2Ng=
X-Gm-Gg: AYBFou0nliO0Ynkgca/lg/EoiGko8pjtYPy+ie54QXIQshjbeQBDIcE8a+U9JccIvSn
	pTnMmqCRQlmbuNETfhicX3id364w71bKxYveFqC2/WV39/fIC6nscLJjfPIT78ggRzoxdOcsFDW
	xpT86teHZIkBb+x/exUIPi2ZZs6DA6teB7zApWq6MuSnPc0YjGwWZTlE9sfq2E+O4tBNwUtqVg6
	9/+TbSzWDhdCKGLmezD8Q76znIwWc1MyVDc+F+7hwrsliyxZxsgvhdf9aShGIw0xxnLJbtU2LWb
	vOzGYKoHfli2Ahn/BAvy+KOQu0DjxUX1K2dg202t6MgLteYmNWJbUUolSv+HyaTEY4BTH7E1CDw
	YWW7WkUdOK9jK+sBWspxrQdVCQOl1tlekFUogdP6+Fd7gIg==
X-Received: by 2002:a05:620a:2783:b0:93e:d051:8f19 with SMTP id
 af79cd13be357-93f29ced575mr485953085a.40.1792250716444; Sat, 17 Oct 2026
 08:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20261017110213.46199-1-tharitt97@gmail.com> <20261017110213.46199-6-tharitt97@gmail.com>
In-Reply-To: <20261017110213.46199-6-tharitt97@gmail.com>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Sat, 17 Oct 2026 22:25:04 +0700
X-Gm-Features: AclHuK8Bu8EDo40zZmiyUcWdeJAzBkx4-shpMZtTbASYDmEugT246DxrXg3J2Ik
Message-ID: <CACak8wNa-dbNMGO=4U=JpTqSYWdk9MC+DWZS3WxRwuRRvC1T7g@mail.gmail.com>
Subject: Re: [PATCH 5/5] KVM: selftests: Test protection of the ucall MMIO region
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_082518_126825_3531262C 
X-CRM114-Status: UNSURE (   7.67  )
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

> +#define CLOBBERED_SLOT         TEST_MEM_SLOT_BASE
Upon self-review, this should have been hardcoded to 1 (to clobber the
reserved ucal mmio).

> +       ret = __vm_set_user_memory_region2(vm, CLOBBERED_SLOT, 0,
> +                                          vm->ucall_mmio_addr, slot_size, slot_mem, 0, 0);
> +       TEST_ASSERT(ret == -1 && errno == EEXIST,
> +                   "Expected the ucall GPA overlap to be rejected: ret=%d errno=%d",
> +                   ret, errno);
This should have been errno == EINVAL check to catch writing to the
exiting read-only slot.

The earlier test accidentally passed because it used a different slot
ID (=2, not reserved) and received EEXIST for overlapping the reserved
ucall GPA. It therefore tested GPA overlap rejection, not the intended
rejection of overwriting slot 1.

I will fix it in v2


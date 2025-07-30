Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB36CC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 15:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5S/gfwjHD+oJdrQWb3m/7MfRXYBPvNIQcNwOPtzGuc=; b=LxPj2CubvsnAFtYy0hd+BMDIRD
	ZJLp4/pPuUdQbeNKmFBr7X3/giw8BCiJh0xKbhMRwHmOZYan4KWve8b6Qf4JcuXssk0wzWLIr7msn
	kBkWk1C0GYpJPJ+apmXf/O0MJ2dQS48IGgllrPaoyjbp9/RH3HLsjmXU4lBChliE2vCB18wlopxwh
	Hr96JZSwKwFO/CQ3f0oEOGSNTu27qVoJaiPk6QH1we+gHyTtaYw1mYZ7E/0fi/dCNfQGKOweQ/Gh9
	nSmmYaX+NqCUfQOcbh06cF/gyV4ok/qapP2Kn+3GMW98Yq41gqUM8CIoE9YjgUfMXeKdzU60Mz7rc
	M0gx2wtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh99P-00000001tiZ-27CE;
	Wed, 30 Jul 2025 15:55:31 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh96Q-00000001tIc-0QKB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 15:52:27 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4ab3ad4c61fso514641cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 08:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753890744; x=1754495544; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J5S/gfwjHD+oJdrQWb3m/7MfRXYBPvNIQcNwOPtzGuc=;
        b=QxHYtw5DNrwBNw86vIylNl8nl0d621mwIWOpYoWF7zMNUoGPleDpEurK25N6IJRKt/
         +mMSAhMXKgNo1Z5Xy9XLdjqaW1unVxevtsiIHd0HxJZ14363rLpJJ/ENd+eQjAWnzQi/
         UThHMgrJRzdh0SD1HZIiL5uq5KX8vW0zHAfR68AvBuXL3OPJLbPVUUFlssoVeAFjl12u
         AvDNtNhTCq5LXfs5j9lnUH+ELYUIg/u6oTZLBTtwsUV71R8wnrSOStpgtOH8mcqcGS+m
         KRgUmB7SPqVmZtCF8FM6PfweUGsV0387HrbktCc5Srh0zSSSH7V0RUCRm1fH7UDX0Z84
         fl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753890744; x=1754495544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5S/gfwjHD+oJdrQWb3m/7MfRXYBPvNIQcNwOPtzGuc=;
        b=j0j5+Se6ljDPF6CBol+BbjCp7x2Qw0ZD8fogd9zgdflCE1czhkIe5WvQnRnPqM/Pra
         wXneb5w0r2WPWiI3oY7WraNPxpWHsYk6teKrKkpLrRXHVELDugN1pp6TxXREbA5dBGiR
         A3tKoXyWf+zw91Wdrk2ZJ/xUAtuRB2tfCcr7iT+oe0cAoB1N7513u+2Xtuff80jQYfuN
         ZqsmTiFNml3tDc6ecwWM3SwaIC8rPt+S3HU60a4zucEMjYIW+Li+A6qI5wmrouMNC4+c
         Ko1Hw35/BqnN4Fai1jUAkxoqTG4y5FtbGvMUplwfT/e/NnuY22kJlDGLshZNPjRf46Ly
         BGVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtIYofPbq1g6a4WE2ghPiqkRL6BmYo0ABUv/maQQlyvLhU86QHN2+LSlUOHrqqh7J2TM2piejd9ppRuKhwEfPx@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq+lr+YNIhbD8UA250lMeCGBLMlLa1wiELd5/rIcdKcvx6sgyZ
	mOuaYUEiJGoorprTtOTI4JvaHYMdyOWdtdzw7/Ml69JEF1Unyng2RHvZv1P7OG8LRPEUSJbeY68
	qpLdYgEmJxEWA55/aUwgM3GYNeEHIPWEfMYOXkFxuRfx9DNSg1WNmOey+
X-Gm-Gg: ASbGncsJC+80QNReyWwFekd3niS9eUoAoUjMpc9JSVhcSt4S5Ctbgy3NXt55rHb2/gT
	0erDjA3+i7NujG0Kll9NOML5iWhAwUpXOqyhlOo7K5CUAQ69ljZ7Iv19vQcwcIqub/PlWxH130G
	Z4FZ40kC3l1YMhDaej/dId2u1tdMllhoPfg1XLhCKhdKxZwQQn0ezpYsyVIMEMXGWvUp9CTcjHm
	2Xt/Co=
X-Google-Smtp-Source: AGHT+IHCoggrbKuqrS/V3GqDELMmyPu68zQZy/cgUabllEs7qJ283gO9wOXP3Z6D76RtekV7nYcliE9mbdlhJ89jyUs=
X-Received: by 2002:a05:622a:b:b0:4a6:f525:e35a with SMTP id
 d75a77b69052e-4aedf608f0emr3661281cf.9.1753890743755; Wed, 30 Jul 2025
 08:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com> <20250729225455.670324-25-seanjc@google.com>
In-Reply-To: <20250729225455.670324-25-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 30 Jul 2025 16:51:47 +0100
X-Gm-Features: Ac12FXzaE318ERqLrJiYydulNyZlDipqqavrDa-QlTdUT7g8r8Yi-Dt4-p51ElI
Message-ID: <CA+EHjTx7V=bHZ3HTN+gK+MzNhwDehiqQXG2r4AYmMKDufYGOww@mail.gmail.com>
Subject: Re: [PATCH v17 24/24] KVM: selftests: Add guest_memfd testcase to
 fault-in on !mmap()'d memory
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, David Hildenbrand <david@redhat.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_085226_168501_B17C93A2 
X-CRM114-Status: GOOD (  22.80  )
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

On Tue, 29 Jul 2025 at 23:56, Sean Christopherson <seanjc@google.com> wrote:
>
> Add a guest_memfd testcase to verify that a vCPU can fault-in guest_memfd
> memory that supports mmap(), but that is not currently mapped into host
> userspace and/or has a userspace address (in the memslot) that points at
> something other than the target guest_memfd range.  Mapping guest_memfd
> memory into the guest is supposed to operate completely independently from
> any userspace mappings.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> ---
>  .../testing/selftests/kvm/guest_memfd_test.c  | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> index 088053d5f0f5..b86bf89a71e0 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -13,6 +13,7 @@
>
>  #include <linux/bitmap.h>
>  #include <linux/falloc.h>
> +#include <linux/sizes.h>
>  #include <setjmp.h>
>  #include <signal.h>
>  #include <sys/mman.h>
> @@ -21,6 +22,7 @@
>
>  #include "kvm_util.h"
>  #include "test_util.h"
> +#include "ucall_common.h"
>
>  static void test_file_read_write(int fd)
>  {
> @@ -298,6 +300,66 @@ static void test_guest_memfd(unsigned long vm_type)
>         kvm_vm_free(vm);
>  }
>
> +static void guest_code(uint8_t *mem, uint64_t size)
> +{
> +       size_t i;
> +
> +       for (i = 0; i < size; i++)
> +               __GUEST_ASSERT(mem[i] == 0xaa,
> +                              "Guest expected 0xaa at offset %lu, got 0x%x", i, mem[i]);
> +
> +       memset(mem, 0xff, size);
> +       GUEST_DONE();
> +}
> +
> +static void test_guest_memfd_guest(void)
> +{
> +       /*
> +        * Skip the first 4gb and slot0.  slot0 maps <1gb and is used to back
> +        * the guest's code, stack, and page tables, and low memory contains
> +        * the PCI hole and other MMIO regions that need to be avoided.
> +        */
> +       const uint64_t gpa = SZ_4G;
> +       const int slot = 1;
> +
> +       struct kvm_vcpu *vcpu;
> +       struct kvm_vm *vm;
> +       uint8_t *mem;
> +       size_t size;
> +       int fd, i;
> +
> +       if (!kvm_has_cap(KVM_CAP_GUEST_MEMFD_MMAP))
> +               return;
> +
> +       vm = __vm_create_shape_with_one_vcpu(VM_SHAPE_DEFAULT, &vcpu, 1, guest_code);
> +
> +       TEST_ASSERT(vm_check_cap(vm, KVM_CAP_GUEST_MEMFD_MMAP),
> +                   "Default VM type should always support guest_memfd mmap()");
> +
> +       size = vm->page_size;
> +       fd = vm_create_guest_memfd(vm, size, GUEST_MEMFD_FLAG_MMAP);
> +       vm_set_user_memory_region2(vm, slot, KVM_MEM_GUEST_MEMFD, gpa, size, NULL, fd, 0);
> +
> +       mem = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> +       TEST_ASSERT(mem != MAP_FAILED, "mmap() on guest_memfd failed");
> +       memset(mem, 0xaa, size);
> +       munmap(mem, size);
> +
> +       virt_pg_map(vm, gpa, gpa);
> +       vcpu_args_set(vcpu, 2, gpa, size);
> +       vcpu_run(vcpu);
> +
> +       TEST_ASSERT_EQ(get_ucall(vcpu, NULL), UCALL_DONE);
> +
> +       mem = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> +       TEST_ASSERT(mem != MAP_FAILED, "mmap() on guest_memfd failed");
> +       for (i = 0; i < size; i++)
> +               TEST_ASSERT_EQ(mem[i], 0xff);
> +
> +       close(fd);
> +       kvm_vm_free(vm);
> +}
> +
>  int main(int argc, char *argv[])
>  {
>         unsigned long vm_types, vm_type;
> @@ -314,4 +376,6 @@ int main(int argc, char *argv[])
>
>         for_each_set_bit(vm_type, &vm_types, BITS_PER_TYPE(vm_types))
>                 test_guest_memfd(vm_type);
> +
> +       test_guest_memfd_guest();
>  }
> --
> 2.50.1.552.g942d659e1b-goog
>


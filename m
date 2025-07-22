Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A56C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 09:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHFy2ib8R7VJ1RgEKC7LoLc8P9a6wfUZ5RjA5auf7Xg=; b=sfT4nkfq1v23BJk6dNRwKppV0J
	yeU9U/LSSZZ8aQUKVOYQomF4VSKUQTBWAC3e0OARKw3edL0SBDGeOS0pkSfx76ennr5GIIqWFKhNm
	jJOwc0BrGW5oG3gSexsBprlkqc3Uecd+zRSN3C/0C505KvLDYOVvuEIEfTvwU5Od0qYENExxqUpOa
	tX4TE8gpYjosWyML/vvfHu8TbxcjT142U8hFwPUSatNB0XbV5kzwC1Or/LwE2Z+VJWqFo6OC2hN24
	giTSs5xCTcoJpwWcZbpVSaeC8qp2ajWqT2vx5zU1OsDyZyvGiIo4brQC5LoYh73b8v/h0ANvQWWv7
	diSqJKXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9TL-0000000229t-3fb5;
	Tue, 22 Jul 2025 09:39:43 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue98X-00000001yn1-47au
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 09:18:15 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso4906340f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 02:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753175892; x=1753780692; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PHFy2ib8R7VJ1RgEKC7LoLc8P9a6wfUZ5RjA5auf7Xg=;
        b=Yri0Uc5fKnCuBdFBR9UTIV8Ph+YEYfvoq/ZuHR8VxnHy4EuuBQXBHuZh7VOfmDDuah
         e4NNdJjuQEFlS8FdV8tM0CAN9XSR1IXbbv4S3714JLn9x+FSCogqQtoq2aVrU3eH7mLF
         3gDOvh1kfdN9dFS8bGVwlHbC23vHWlNgnOF3KRiGpGeegIDCg+cYSMkgghk9YW7elgEG
         0I3h/MVWhCK7DPVcQKXM2oGwqZEUSkSiezWKqNjt6zWopuOv3FZE0eB9l2OsI2K2+EQ7
         wM3gcIG0JA6T9e4Y0vyJ6pdfeR6PJmcpmpM1SgS2Uramow9/Pe7meJFQ9+N5ioSO73sV
         +5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753175892; x=1753780692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHFy2ib8R7VJ1RgEKC7LoLc8P9a6wfUZ5RjA5auf7Xg=;
        b=VN0OcTwtmH4onZuAkpYZH+buLDoVTIZ/GecsTwXFt1OBj31yjngQJyM3tjPriLjWnO
         NLekqJF8rY2KUWcU7TE89hjflZpQlKujazGaOrYbe4nIWp8lWkMt4mCguhY8vDKHJ/Tx
         icGJRuBrM1pta63yj0abeXnwzXzm34DM1+GQb1vNcxTF8IjyaDoq3U7y5J6Kl/TNZgDl
         Y/K8bNe/7QcIz8kV+Y0+93hk8+e7QKOdh8RYJQbiD/p7LGMRLx91FkHP4CuAEdnaiVoG
         u8O7mbcwAu8FrSmroM/ZiI3NM8AONQ6+1x0yn1idI9PvCDPIRUA6pFY+d2PwNtJVUaf1
         1t3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsi/5XLmQa081alZXWZ5iu5kIj1foRhp3ALA5dJGb6NSv+TfsOQo/v+fVWDkqGmhYNE91CxGdgT4zdl6o/sxqg@lists.infradead.org
X-Gm-Message-State: AOJu0YzOozWzPSZeiXM5f84Ra41+YiQnn/HWVxV1ywv0aorfxh8+APDr
	bQ0cW+S+G+r7DJEKqGF2577nB4ixF9ipxNbOgBYwK4ogbYZvdRE4sFJboiCOZUgPiGo=
X-Gm-Gg: ASbGncvoVmvF4Whv5jCrpMsNBK6dFukz/hxlbEGE5pSV2PvoHdllcpp/E9vrE4zrPBc
	ja10bsg8J94kj9X6gonlWttSgC86s7pRBWCcvwpT52KkEn+BnvF4UQaZqTC14HY8qEf3+j21EMb
	9XoJT7JewHXns0tq1plb4FbRygsZWIJWaFm8QHFCQoSX+Bwx811lGQ01Qwbn4f5HpXDfAcUwPcg
	z6ojvPEkgD5CdCwTRkca86UZyoz6x53vn+n9l02QCsk9yWPkRgVkPS8uHTzF01zrGRtC/cQYF6I
	kmVeN52Zece1a9EcACrhrN+2t7fuwWsSeR5iHGTY+HhobDmMQw++Q0cir63HZG/AyclfQrsee4p
	QAaE9aUsnfQ==
X-Google-Smtp-Source: AGHT+IHQBAZgY70xI+dtP0yh6yvLOKV0BlM/uTMSPEIciqVVZwMQSsJNaHFcQVjMoLC9XYi1w0Ju7g==
X-Received: by 2002:a05:6000:2892:b0:3a4:f379:65bc with SMTP id ffacd0b85a97d-3b60e523efamr18492284f8f.40.1753175891891;
        Tue, 22 Jul 2025 02:18:11 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f15c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a2esm12946678f8f.51.2025.07.22.02.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 02:18:11 -0700 (PDT)
Date: Tue, 22 Jul 2025 11:18:10 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, jackabt@amazon.com
Subject: Re: [PATCH] KVM: arm64: selftest: Add standalone test checking for
 KVM's own UUID
Message-ID: <20250722-87ac9d7e0b27cf7c67a4fbd3@orel>
References: <20250721155136.892255-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721155136.892255-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_021814_023744_6DBBCE1A 
X-CRM114-Status: GOOD (  26.24  )
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

Hi Marc,

On Mon, Jul 21, 2025 at 04:51:36PM +0100, Marc Zyngier wrote:
> Tinkering with UUIDs is a perilious task, and the KVM UUID gets
> broken at times. In order to spot this early enough, add a selftest
> that will shout if the expected value isn't found.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/20250721130558.50823-1-jackabt.amazon@gmail.com
> ---
>  tools/testing/selftests/kvm/Makefile.kvm     |  1 +
>  tools/testing/selftests/kvm/arm64/kvm-uuid.c | 67 ++++++++++++++++++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/arm64/kvm-uuid.c
> 
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index ce817a975e50a..e1eb1ba238a2a 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -167,6 +167,7 @@ TEST_GEN_PROGS_arm64 += arm64/vgic_irq
>  TEST_GEN_PROGS_arm64 += arm64/vgic_lpi_stress
>  TEST_GEN_PROGS_arm64 += arm64/vpmu_counter_access
>  TEST_GEN_PROGS_arm64 += arm64/no-vgic-v3
> +TEST_GEN_PROGS_arm64 += arm64/kvm-uuid
>  TEST_GEN_PROGS_arm64 += access_tracking_perf_test
>  TEST_GEN_PROGS_arm64 += arch_timer
>  TEST_GEN_PROGS_arm64 += coalesced_io_test
> diff --git a/tools/testing/selftests/kvm/arm64/kvm-uuid.c b/tools/testing/selftests/kvm/arm64/kvm-uuid.c
> new file mode 100644
> index 0000000000000..89d9c8b182ae5
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/arm64/kvm-uuid.c
> @@ -0,0 +1,67 @@
> +#include <errno.h>
> +#include <linux/arm-smccc.h>
> +#include <asm/kvm.h>
> +#include <kvm_util.h>
> +
> +#include "processor.h"
> +
> +/*
> + * Do NOT redefine these constants, or try to replace them with some
> + * "common" version. They are hardcoded here to detect any potential
> + * breakage happening in the rest of the kernel.
> + *
> + * KVM UID value: 28b46fb6-2ec5-11e9-a9ca-4b564d003a74
> + */
> +#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_0	0xb66fb428U
> +#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_1	0xe911c52eU
> +#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_2	0x564bcaa9U
> +#define ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3	0x743a004dU
> +
> +static void guest_code(void)
> +{
> +	struct arm_smccc_res res = {};
> +
> +	smccc_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, 0, 0, 0, 0, 0, 0, 0, &res);
> +
> +	__GUEST_ASSERT(res.a0 != SMCCC_RET_NOT_SUPPORTED, "a0 = %lx\n", res.a0);

Should this check res.a0 == SMCCC_RET_SUCCESS instead?

> +	__GUEST_ASSERT(res.a0 == ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_0 &&
> +		       res.a1 == ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_1 &&
> +		       res.a2 == ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_2 &&
> +		       res.a3 == ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_3,
> +		       "Unexpected KVM-specific UID %lx %lx %lx %lx\n", res.a0, res.a1, res.a2, res.a3);
> +	GUEST_DONE();
> +}
> +
> +int main (int argc, char *argv[])
> +{
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_vm *vm;
> +	struct ucall uc;
> +	bool guest_done = false;
> +
> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
> +
> +	while (!guest_done) {
> +		vcpu_run(vcpu);
> +
> +		switch (get_ucall(vcpu, &uc)) {
> +		case UCALL_SYNC:
> +			break;
> +		case UCALL_DONE:
> +			guest_done = true;
> +			break;
> +		case UCALL_ABORT:
> +			REPORT_GUEST_ASSERT(uc);
> +			break;
> +		case UCALL_PRINTF:
> +			printf("%s", uc.buffer);
> +			break;
> +		default:
> +			TEST_FAIL("Unexpected guest exit");
> +		}
> +	}

This is becoming a very common and useful pattern. I wonder if it's time
for a ucall helper

static void ucall_vcpu_run(struct kvm_vcpu *vcpu,
                           void (*sync_func)(struct kvm_vcpu *, void *),
                           void *sync_data)
{
        bool guest_done = false;
        struct ucall uc;

        while (!guest_done) {
                vcpu_run(vcpu);

                switch (get_ucall(vcpu, &uc)) {
                case UCALL_SYNC:
                        if (sync_func)
                                sync_func(vcpu, sync_data);
                        break;
                case UCALL_DONE:
                        guest_done = true;
                        break;
                case UCALL_ABORT:
                        REPORT_GUEST_ASSERT(uc);
                        break;
                case UCALL_PRINTF:
                        printf("%s", uc.buffer);
                        break;
                default:
                        TEST_FAIL("Unexpected guest exit");
                }
        }
}

Thanks,
drew

> +
> +	kvm_vm_free(vm);
> +
> +	return 0;
> +}
> -- 
> 2.39.2
> 


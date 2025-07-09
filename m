Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABF5C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPkxg71a8xKMOk7gRt6YiWOPIe8HfaUrT3StylJgAHI=; b=IUE/y+2cRK2jiUFLC3UXzuG4UR
	6mVUs7S3GYs9gj4C7N/2eXf3cqx99RMiJh5nNotx/2u5esoVVfP5Opomx4k0Rz2++KR7KxC4gwVDz
	Tt/5tLiQCWpXp7kuh5Amh9MLSACmJO5igWSJ9YWmNabB6mlkZtNIRv7UbVevKRxDE74Rkz2dGQtM5
	9AdYRCXM+DiBGNdHTersQygNBfpFNTa3z2DvgAC3EZ+sEwWZ0QPK8vrU8LG+TToIOvXuXuCixN7h5
	cPHNXbh6tpELKGsiGdJPUQPJcweDO4H4VtkTJ5m+k6Dofhi5B0kFGMBxokIHN2fBiCctAtHj315l6
	dQx0L0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdjX-0000000AAq4-0B38;
	Wed, 09 Jul 2025 22:57:47 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcr4-0000000A061-3dry
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 22:01:31 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3122368d82bso592635a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 15:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752098490; x=1752703290; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qPkxg71a8xKMOk7gRt6YiWOPIe8HfaUrT3StylJgAHI=;
        b=eXo/aOc4yqtkS1MTtVyyVWc3dSIFcnbZ5XW/4yTUZLmMmuGP1dHzwKnw4Dj2uo1Bf9
         zA09CQ5JYCS0x2/eUjkf4c1bSsiV1Dpe4rFaxsAdKZyXe+qMiw16l+CBnLeV/ym3AkVH
         Xx0MLAGky1Ohw0F620EiKpblyP5tOUIBH1lZ1LqGJix4JLj3fpdEfpC5FEDRIKlKmpLW
         o7i0OoSjpRTUHLSVBooAHZzSWw/ACgdOhF9FHT3kkPUS35grUcTYwVp6jHfTJZwBVN8M
         Q77o9rKXkwkZYrWW8mej/Qx+Ap22bTsTnADiG7o1gUasrfHlugmxoonZb+nFMrb/llcH
         t9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752098490; x=1752703290;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qPkxg71a8xKMOk7gRt6YiWOPIe8HfaUrT3StylJgAHI=;
        b=bum+lxmcflCtPknTYCTN1TMEAb+sBGBY2m+2TBeWG1GRwX5mR+gewMj9jYwT7XXaBf
         TiaWHXWMKotc+EfmSsUgoDg/336cBp0pDa8PPPyABRgWL+XZNcmVyZwrwg8VjQ2FqpP7
         kXvoX2++014P0Qwz1Ntj0GRxDBI3HmVk9e/n2H8581jQV6+XJDlxjVZyUePiiL6jilgH
         cUOnrKhi8W+7DQNsaefOEvupZGdgjq9KuXQdWIEjiheuLtG33pW90fMocUy2BLieus64
         KxFqjcZbr1yvTcKtKfuBBpXog6nxMilvnKbdihQTwgxB7l8sOuC58gqslD9QqKu+T5/g
         Iqgw==
X-Forwarded-Encrypted: i=1; AJvYcCUGJhUkYyXzSdhX4fAXGANdxsRJT77RBgjzHXTZXJQQLPUkOwHfVzRf+e4Aw0FhDrn4J4KVSQ+jAJlCzmUzC725@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjr3A4EaPg5kWj5uM1ddgTNbcN0HBeaMtzQX7T6WPIdZnPtT9Q
	luR4Ch5Svz8yMDnL98ELvwCUWLXxBVtP+HFiSpMK8SyqVv+EYOcRXN+Dzh/rgWpD/CVET6yAXyy
	mxwMwmg==
X-Google-Smtp-Source: AGHT+IGv5Auh5afur7rrmDtcmRu/ac16McioXeHVJV7IWM1fJ+YSaOB7uGrq5SXWMiQzxRu0kWJqhfgibQ4=
X-Received: from pjblw1.prod.google.com ([2002:a17:90b:1801:b0:31c:2fe4:33b9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2b43:b0:312:e279:9ccf
 with SMTP id 98e67ed59e1d1-31c3ef100acmr359390a91.5.1752098489536; Wed, 09
 Jul 2025 15:01:29 -0700 (PDT)
Date: Wed, 9 Jul 2025 15:01:28 -0700
In-Reply-To: <20250606235619.1841595-8-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com> <20250606235619.1841595-8-vipinsh@google.com>
Message-ID: <aG7muHNldvv8fRyH@google.com>
Subject: Re: [PATCH v2 07/15] KVM: selftests: Add various print flags to KVM
 Selftest Runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com, 
	anup@brainfault.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev, 
	dmatlack@google.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_150130_905001_FB8F59E4 
X-CRM114-Status: GOOD (  16.35  )
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

On Fri, Jun 06, 2025, Vipin Sharma wrote:
> Add various print flags to selectively print outputs on terminal based
> on test execution status (passed, failed, timed out, skipped, no run).
> 
> Provide further options to print only particular execution status, like
> print only status of failed tests.
> 
> Example: To print status, stdout and stderr for failed tests and only
> print status of passed test:
> 
>    python3 runner --test-dirs tests  --print-failed \
>    --print-passed-status
> 
> Signed-off-by: Vipin Sharma <vipinsh@google.com>
> ---
>  .../testing/selftests/kvm/runner/__main__.py  | 114 ++++++++++++++++++
>  .../selftests/kvm/runner/test_runner.py       |  10 +-
>  2 files changed, 123 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
> index 3f11a20e76a9..4406d8e4847a 100644
> --- a/tools/testing/selftests/kvm/runner/__main__.py
> +++ b/tools/testing/selftests/kvm/runner/__main__.py
> @@ -64,9 +64,115 @@ def cli():
>                          default=False,
>                          help="Print only test's status and avoid printing stdout and stderr of the tests")
>  
> +    parser.add_argument("--print-passed",
> +                        action="store_true",
> +                        default=False,
> +                        help="Print passed test's stdout, stderr and status."
> +                        )
> +
> +    parser.add_argument("--print-passed-status",
> +                        action="store_true",
> +                        default=False,
> +                        help="Print only passed test's status."
> +                        )

Waaay too many booleans :-)

And they don't provide the right granularity.  E.g. I don't want stdout for FAILED,
I just want stderr for the assert.

After some fiddling, I came up with this:

    parser.add_argument("--print-passed", default="full", const="full", nargs='?', choices=["off", "full", "stderr", "stdout", "status"],
                        help="blah"
                        )

    parser.add_argument("--print-failed", default="full", const="full", nargs='?', choices=["off", "full", "stderr", "stdout", "status"],
                        help="Full = print each test's stdout, stderr and status; status = only status."
                        )

    parser.add_argument("--print-skipped", default="full", const="full", nargs='?', choices=["off", "full", "stderr", "stdout", "status"],
                        help="Print skipped test's stdout, stderr and status."
                        )

    parser.add_argument("--print-timed-out", default="full", const="full", nargs='?', choices=["off", "full", "stderr", "stdout", "status"],
                        help="Print timed out test's stdout, stderr and status."
                        )

    parser.add_argument("--print-no-run", default="full", const="full", nargs='?', choices=["off", "full", "stderr", "stdout", "status"],
                        help="Print stdout, stderr and status for tests which didn't run."
                        )

The const+nargs magic makes a bare option equivalent to "full", e.g. --print-timed-out
and --print-timed-out=full are the same.  That gives the user complete control
over the output, with _less_ code in the runner.  E.g. to print stdout and/or stderr:

        print_level = self.print_stds.get(test_result.status);
        if (print_level == "full" or print_level == "stdout"):
            logger.info("*** stdout ***\n" + test_result.stdout)

        if (print_level == "full" or print_level == "stderr"):
            logger.info("*** stderr ***\n" + test_result.stderr)


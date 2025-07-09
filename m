Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C1BC83F18
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTdASi6OvVTUFFgJuSQBI9XSgCI41XMYqPCdISt4Bfc=; b=OeIY3rkcaI4/Z723GnqVDor9VV
	cXapXN8CJ8D8imKLxRlQdBo1CpC0gUdz3c+TWsqnrInBb2Jzp3D/zshqaVrgIAgn3q39zZrBDdE6R
	NA11oNnLmnzU0hJc5io18EiS9TRN6WiZJHoek16/iXLqSqi3iHpx5nhMtXygelzKoZ7kyo2xlTjL1
	5pvQPffGcw2loHdfhbMwvZiFMTpzO7cEkpt7PuzscHnQnHAcC8WNSbuVNflXidqG/meXFgWWvkauB
	oSRJBG5avyFffyxAUf2ifZaMSl4WRdT7kQu8fuSv5EtIhm+Gy+kQwlwUpGpFXnRXO3Vo+zZVr/Sjq
	/SFizGMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdjU-0000000AAjZ-1qnf;
	Wed, 09 Jul 2025 22:57:44 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcim-00000009wuz-1TZn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 21:52:57 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b2fcbd76b61so416044a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 14:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752097975; x=1752702775; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XTdASi6OvVTUFFgJuSQBI9XSgCI41XMYqPCdISt4Bfc=;
        b=rliQ0pH653dBpRXSv+slJTtsLPektfxjVIfGe3ZHwKaBWj3raH5BlfHkMsqxqMNOy6
         81y8wFljY28J6QYQpR03ZKdeMW/JaSMuV2wrHbSC3V2Ltrm2BvmtrmoBm+tfmxGfBxW+
         mc9SVQ23UYnFygfNBkuXx6Vnw7EvTAV20kjpB0nlcDYjCXv8CQFOhC/epWIQwAlCOXsJ
         KwIMLidmfu4l0mRJ+BPfhqlowFuPIkdRyQyLmThSD59eSseCzfP9HcHIliJqro1KCRCg
         X9AJw6FaNJHW678BVTkklm/ix2Own+jaqmv+e64JJCBLvfk+j6aIzAr2B2AvYAaVc6fa
         ug0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752097975; x=1752702775;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XTdASi6OvVTUFFgJuSQBI9XSgCI41XMYqPCdISt4Bfc=;
        b=XgsBBVZoNUGmIRxD2h1vjER0Leu1n9vWc3NHEyh8n2CXrNVMTnixa0uT5nYFjmjpK1
         CzNWiv8ill8ffSSG/U132KBKKpqDWqzngzO4GgQpnvF0Ifx6U4BjojVpMtX+OjoubmDy
         ZNHQnt2/rGiWs6Su882X4S80Z6M8U0aphKk7Dlgg0oJbFk/WLZ5Zd/YypHBcyF2LsPn7
         5mJL37jWquCnkhqU/EuMPVX/SSsHxrwgE8zBoR3sz4uEYlSWXX7dzr6t+LFSx3c+ksA7
         kbv/ccRM4jgcoJbu88KhTuUZWRptxS2gzcyrx0xgJeMup8egUaFOjqjScJ/KAXe8tdK8
         x+wQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1n2H8i66PmhIM7uoFHj1IiUx+UdcVL5Yk/FCLGBuaO+Bwq0RGyXICMbtUw8O6ObV8119Y60rhxCIfESIMw7WP@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkdx/VgqPXLbbpe2BXbseTaf5nxjv2XuJdBTtzNGNwROOWKcNx
	LgpjLpGpx6wuRzfJ3Ni8ljjcSCNkbRJiToAQrTjDoe4nsSCPqBVR1zelW7CM2F6uKqqFuccQfwz
	n0Aq0vw==
X-Google-Smtp-Source: AGHT+IFmEFlAWWCJkx2sQJoOnRz9L04dVDgiZhvskOboq7Is0Q/s9F5fo+EcgpfALlAli5CGcDY8mYpclV0=
X-Received: from pjbpq7.prod.google.com ([2002:a17:90b:3d87:b0:313:17cf:434f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d8b:b0:312:db8:dbd1
 with SMTP id 98e67ed59e1d1-31c3eeece0cmr314345a91.5.1752097974921; Wed, 09
 Jul 2025 14:52:54 -0700 (PDT)
Date: Wed, 9 Jul 2025 14:52:53 -0700
In-Reply-To: <20250606235619.1841595-5-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com> <20250606235619.1841595-5-vipinsh@google.com>
Message-ID: <aG7ktaz8l4zrwPDX@google.com>
Subject: Re: [PATCH v2 04/15] KVM: selftests: Add option to save selftest
 runner output to a directory
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com, 
	anup@brainfault.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev, 
	dmatlack@google.com
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_145256_387566_2057C032 
X-CRM114-Status: GOOD (  22.10  )
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
> -    def run(self):
> +    def _run(self, output=None, error=None):
>          run_args = {
>              "universal_newlines": True,
>              "shell": True,
> -            "capture_output": True,
>              "timeout": self.timeout,
>          }
>  
> +        if output is None and error is None:
> +            run_args.update({"capture_output": True})

The runner needs to check that its min version, whatever that ends up being, is
satisfied.

capture_output requires 3.7, but nothing in the runner actually checks that the
min version is met.  If you hadn't mentioned running into a problem with 3.6, I
don't know that I would have figured out what was going wrong all that quickly.

There's also no reason to use capture_output, which appears to be the only
3.7+ dependency.  Just pass subprocess.PIPE for stdout and stderr.

> +        else:
> +            run_args.update({"stdout": output, "stderr": error})
> +
>          proc = subprocess.run(self.command, **run_args)
>          return proc.returncode, proc.stdout, proc.stderr
> +
> +    def run(self):
> +        if self.output_dir is not None:
> +            pathlib.Path(self.output_dir).mkdir(parents=True, exist_ok=True)
> +
> +        output = None
> +        error = None
> +        with contextlib.ExitStack() as stack:
> +            if self.output_dir is not None:
> +                output_path = os.path.join(self.output_dir, "stdout")
> +                output = stack.enter_context(
> +                    open(output_path, encoding="utf-8", mode="w"))
> +
> +                error_path = os.path.join(self.output_dir, "stderr")
> +                error = stack.enter_context(
> +                    open(error_path, encoding="utf-8", mode="w"))
> +            return self._run(output, error)
> diff --git a/tools/testing/selftests/kvm/runner/selftest.py b/tools/testing/selftests/kvm/runner/selftest.py
> index 4c72108c47de..664958c693e5 100644
> --- a/tools/testing/selftests/kvm/runner/selftest.py
> +++ b/tools/testing/selftests/kvm/runner/selftest.py
> @@ -32,7 +32,7 @@ class Selftest:
>      Extract the test execution command from test file and executes it.
>      """
>  
> -    def __init__(self, test_path, executable_dir, timeout):
> +    def __init__(self, test_path, executable_dir, timeout, output_dir):
>          test_command = pathlib.Path(test_path).read_text().strip()
>          if not test_command:
>              raise ValueError("Empty test command in " + test_path)
> @@ -40,7 +40,11 @@ class Selftest:
>          test_command = os.path.join(executable_dir, test_command)
>          self.exists = os.path.isfile(test_command.split(maxsplit=1)[0])
>          self.test_path = test_path
> -        self.command = command.Command(test_command, timeout)
> +
> +        if output_dir is not None:
> +            output_dir = os.path.join(output_dir, test_path.lstrip("/"))
> +        self.command = command.Command(test_command, timeout, output_dir)
> +
>          self.status = SelftestStatus.NO_RUN
>          self.stdout = ""
>          self.stderr = ""
> diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
> index 1409e1cfe7d5..0501d77a9912 100644
> --- a/tools/testing/selftests/kvm/runner/test_runner.py
> +++ b/tools/testing/selftests/kvm/runner/test_runner.py
> @@ -13,19 +13,22 @@ logger = logging.getLogger("runner")
>  class TestRunner:
>      def __init__(self, test_files, args):
>          self.tests = []
> +        self.output_dir = args.output
>  
>          for test_file in test_files:
> -            self.tests.append(Selftest(test_file, args.executable, args.timeout))
> +            self.tests.append(Selftest(test_file, args.executable,
> +                                       args.timeout, args.output))
>  
>      def _log_result(self, test_result):
>          logger.log(test_result.status,
>                     f"[{test_result.status}] {test_result.test_path}")

Previous patch, but I missed it there.  Print the *name* of the result, not the
integer, which is arbitrary magic.  i.e

        logger.log(test_result.status,
                   f"[{test_result.status.name}] {test_result.test_path}")

> -        logger.info("************** STDOUT BEGIN **************")
> -        logger.info(test_result.stdout)
> -        logger.info("************** STDOUT END **************")
> -        logger.info("************** STDERR BEGIN **************")
> -        logger.info(test_result.stderr)
> -        logger.info("************** STDERR END **************")
> +        if (self.output_dir is None):

Ugh.  I want both.  Recording to disk shouldn't prevent the user from seeing
real-time data.

Rather than redirect to a file, always pipe to stdout/stderr, and then simply
write to the appropriate files after the subprocess completes.  That'll also force
the issue on fixing a bug with timeouts, where the runner doesn't capture stdout
or stderr.

> +            logger.info("************** STDOUT BEGIN **************")
> +            logger.info(test_result.stdout)
> +            logger.info("************** STDOUT END **************")
> +            logger.info("************** STDERR BEGIN **************")
> +            logger.info(test_result.stderr)
> +            logger.info("************** STDERR END **************")

This is unnecessarily verbose.  The logger spits out a timestamp, just use that
to demarcate, e.g.

	logger.info("*** stdout ***\n" + test_result.stdout)
	logger.info("*** stderr ***\n" + test_result.stderr)

yields

14:52:29 | *** stdout ***
Random seed: 0x6b8b4567

14:52:29 | *** stderr ***
==== Test Assertion Failure ====
  x86/state_test.c:316: memcmp(&regs1, &regs2, sizeof(regs2))
  pid=168652 tid=168652 errno=4 - Interrupted system call
     1	0x0000000000402300: main at state_test.c:316 (discriminator 1)
     2	0x000000000041e413: __libc_start_call_main at libc-start.o:?
     3	0x00000000004205bc: __libc_start_main_impl at ??:?
     4	0x00000000004027a0: _start at ??:?
  Unexpected register values after vcpu_load_state; rdi: 7ff68b1f3040 rsi: 0

>  
>      def start(self):
>          ret = 0
> -- 
> 2.50.0.rc0.604.gd4ff7b7c86-goog
> 


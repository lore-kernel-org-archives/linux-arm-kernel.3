Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663C2C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 21:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuwtCmee8bUCMaCxATpebgMybOMoD89ZAK9YtlS2GJU=; b=KUV0oUv/N9lENd70ccJZT+V54s
	vstX+zktebWCw8r5Eq5YJkh+o0tVQ+d27TUTYH8kiT4QAbcio/hpJZSS7Iw83jf3aWNSywB3m4TUD
	vbPy/gXLWrxN9uaaSYEAwHSOV9ymIF0ZXT2h9LQ90NVguDr30WHNwWExGl0Oyl+s+s+JJ0iD0Vw0r
	zXUGkbpUsdP1YK1i+FCIunGSRvqsh9NJpQzYBBj2Lj4wVs1BG+dbIBQyQsjlOTU8FJEvDvpAGVbcV
	zLeiB0S88AK/MCvHdvYoctuPR7JF+DLVSaBihZCHaRz205keekhGrnCjbeD/0W2SeXGQJToLvkRMo
	h+kUaIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAF3F-0000000E5Li-3dSR;
	Wed, 30 Apr 2025 21:33:09 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAF1I-0000000E4dr-0iky
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 21:31:09 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3011bee1751so278917a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 14:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746048666; x=1746653466; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xuwtCmee8bUCMaCxATpebgMybOMoD89ZAK9YtlS2GJU=;
        b=YswCFDk+XwEj2cXH5DCPbDCHl4edNaGAop9vP0mGPz14f2jrzcahLFIsAUZfTiLGqd
         nY4vNZ60bQh290JaIlzIYED365cQiOVyrAUcIFqMjuGuXiZB9745nTH6Efl4zaX/Fj5s
         /NI4ZL0qtgKN3IGYq8yllz+HGePkmwG4JeDymLYOU4E8GzYrtZyhq2sz7Ki9MXDpoOLm
         ZZaJqNkFR4Dseh4oLHcuIrMJrPIzxOl6uVALbPG9bABSHq600/Tr0KR/p+z6MOAeAM8M
         RPWgisKn28xcb/083mkAab3bFhaHFhkL5jYsLzysL2oAq5Z2KY7F9ecFfdVc83PiFPO2
         ATFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746048666; x=1746653466;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xuwtCmee8bUCMaCxATpebgMybOMoD89ZAK9YtlS2GJU=;
        b=pDmw0jjbcwTJDHuzLuJx3ZNUVg1U6yltHzUfqmAa2TzNp++1bDDhpPVQevHBNx6OM2
         ZzpSLoQmzr5zqEvHxwA/DsZuizmKRP5Y/xRR6sjtRTveAv+TSlOI3tz2Yb3U9N4Ugelr
         eL9Hsxpe4YnCum/NU2g53g90GSHra5sTGcp2lEqGQAakV7mB5xL6CHbuwvRCQ2r292u2
         xf2b/Mxr2O2Gs0Rx+GxT/cjahF6P3OEgzH2Wspdxt9+6eeLWxg9v1nM/kuVJR1vRlnRy
         CqQtZW2T645VKOF0XGigmaCLBZzvPJL/ERVyIsvQdO14BAn/9PL2s0vOXZqFl4jbq1C+
         EJlw==
X-Forwarded-Encrypted: i=1; AJvYcCXdeyhUq+FSu/bU45cn9ANYj0kus2s9EaQIM/d0omS1arWONvqajiEMAq3tiCUlSiSdskEBfH1SHtzBIThtouKt@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6sD0ACmPZx/cm4ZcrIOs819/2zhCPwMkR1Mf2YGkfwoynFpqJ
	0YA7CRMGYyHZ/1QxLasVeCBuk6+SJr8vd+C2Rav462753XJu5qTcJLzrNy1X2Kg+LlymB1XBxfu
	/lg==
X-Google-Smtp-Source: AGHT+IF7u1ROE1txYWgvgQtIPyo8p3omIkgPpGClJtR2AwQs8qcKywBRQB3ypqTRcMHct1VgXw598olvhbg=
X-Received: from pjbsn16.prod.google.com ([2002:a17:90b:2e90:b0:2fc:2f33:e07d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:da8e:b0:2ff:7b28:a51a
 with SMTP id 98e67ed59e1d1-30a34409defmr7144925a91.17.1746048666708; Wed, 30
 Apr 2025 14:31:06 -0700 (PDT)
Date: Wed, 30 Apr 2025 14:31:05 -0700
In-Reply-To: <20250222005943.3348627-3-vipinsh@google.com>
Mime-Version: 1.0
References: <20250222005943.3348627-1-vipinsh@google.com> <20250222005943.3348627-3-vipinsh@google.com>
Message-ID: <aBKWmRDBrjeZhAW0@google.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Create KVM selftest runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com, 
	anup@brainfault.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_143108_212534_9142C9B2 
X-CRM114-Status: GOOD (  35.39  )
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

This is awesome!

I have lots of idea, but not all of them need to be address for the initial
commit.  Some of them I would consider blockers, but I also don't want to e=
nd up
with massive scope creep that causes this to stall out for (more) months on=
 end.

On Fri, Feb 21, 2025, Vipin Sharma wrote:
> Create KVM selftest runner to run selftests and provide various options
> for execution.
>=20
> Provide following features in the runner:
> 1. --timeout/-t: Max time each test should finish in before killing it.

The help for this needs to specify the units.  I assume it's seconds?

> 2. --jobs/-j: Run these many tests in parallel.
> 3. --tests: Provide space separated path of tests to execute.
> 4. --test_dirs: Directories to search for test files and run them.
> 5. --output/-o: Create the folder with given name and dump output of
>    each test in a hierarchical way.
> 6. Add summary at the end.
>=20
> Runner needs testcase files which are provided in the previous patch.
> Following are the examples to start the runner (cwd is
> tools/testing/selftests/kvm)

The runner definitely needs a command line option to specify the path to th=
e
test executables.  Defaulting to in-tree builds is totally fine, but we sho=
uld
also support out-of-tree builds (or copying to a remote host, etc.).

The default testcases will have relative paths, e.g. $arch/$test, so the us=
er
will still need to maintain the same directory structure as in-tree builds,=
 but
IMO that's totally fine.

> - Basic run:
>   python3 runner --test_dirs testcases
>=20
> - Run specific test
>   python3 runner --tests ./testcases/dirty_log_perf_test/default.test
>=20
> - Run tests parallel
>   python3 runner --test_dirs testcases -j 10
>=20
> - Run 5 tests parallely at a time, with the timeout of 10 seconds and
>   dump output in "result" directory
>   python3 runner --test_dirs testcases -j 5 -t 10 --output result
>=20
> Sample output from the above command:
>=20
> python3_binary runner --test_dirs testcases -j 5 -t 10 --output result
>=20
> 2025-02-21 16:45:46,774 | 16809 |     INFO | [Passed] testcases/guest_pri=
nt_test/default.test
> 2025-02-21 16:45:47,040 | 16809 |     INFO | [Passed] testcases/kvm_creat=
e_max_vcpus/default.test
> 2025-02-21 16:45:49,244 | 16809 |     INFO | [Passed] testcases/dirty_log=
_perf_test/default.test


Printing the timestamps to the console isn't terrible interesting, and IMO =
isn't
at all worth the noise.

The PID is nice, but it needs to be printed _before_ the test finishes, and=
 it
needs to track the PID of the test.  If getting that working is non-trivial=
,
definitely punt it for the initial commit.

And presumably INFO is the level of logging.  That needs to go.

> ...
> 2025-02-21 16:46:07,225 | 16809 |     INFO | [Passed] testcases/x86_64/pm=
u_event_filter_test/default.test
> 2025-02-21 16:46:08,020 | 16809 |     INFO | [Passed] testcases/x86_64/vm=
x_preemption_timer_test/default.test
> 2025-02-21 16:46:09,734 | 16809 |     INFO | [Timed out] testcases/x86_64=
/pmu_counters_test/default.test

I would really like to have terminal colored+bolded output for tests that f=
ail
(or timeout) or are skipped.

I think we should also provide controls for the verbosity of the output.  E=
.g. to
skip printing tests that pass entirely.  My vote would be for a collection =
of
boolean knobs, i.e. not a log_level or whatever, because inevitably we'll e=
nd up
with output that isn't strictly "increasing".

Adding a param to disable printing of passed tests is presumably trivial, s=
o maybe
do that for the initial commit, and then we can work on the fancier stuff?

> 2025-02-21 16:46:10,202 | 16809 |     INFO | [Passed] testcases/hardware_=
disable_test/default.test
> 2025-02-21 16:46:10,203 | 16809 |     INFO | Tests ran: 85 tests

It would be very nice to have a summary of things printed out periodically.=
  E.g.
if my normal run has a few failures, but the current run has already failed=
 a
decent number of tests, then I'd probably kill the run and start debugging.

Alternatively, and maybe even better, would be to make the runner mildly in=
teractive,
i.e. to accept rudimentary commands while tests are running.  Then the user=
 can
query the state of things while the runner is still doing its thing.  E.g. =
bind
a few keys to print the various statuses.

> 2025-02-21 16:46:10,204 | 16809 |     INFO | Passed: 61
> 2025-02-21 16:46:10,204 | 16809 |     INFO | Failed: 4
> 2025-02-21 16:46:10,204 | 16809 |     INFO | Skipped: 17
> 2025-02-21 16:46:10,204 | 16809 |     INFO | Timed out: 3
> 2025-02-21 16:46:10,204 | 16809 |     INFO | No run: 0

A not-quite-mandatory, but very-nice-to-have feature would be the ability t=
o
display which tests Passed/Failed/Skipped/Timed Out/Incomplete, with comman=
d line
knobs for each.  My vote is for everything but Passed on-by-default, though=
 it's
easy enough to put a light wrapper around this (which I'll do no matter wha=
t), so
my preference for the default doesn't matter all that much.

That could tie into the above idea of grabbing keys to print such informati=
on on-demand.

Also CTRL-C handling needs much more graceful output.  Ideally, no stack tr=
aces
whatsover, and instead a summary like the above, but with information about=
 which
tests didn't complete.

> Output dumped in result directory
>=20
> $ tree result/
> result/

The runner should have an (on-by-default?) option to abort if the output di=
rectory
already exists, e.g. so that users don't clobber previous runs.  And/or an =
option
to append a timestamp, e.g. $result.yyyy.mm.dd.MM.SS, so that all users don=
't end
up writing the same wrapper to generate a timestamp.

Having a no-timestamp + overwrite mode is also useful, e.g. when I'm runnin=
g in
a more "interactive" mode where I'm doing initial testing of something, and=
 I
don't care about

> =E2=94=9C=E2=94=80=E2=94=80 log
> =E2=94=94=E2=94=80=E2=94=80 testcases
>     =E2=94=9C=E2=94=80=E2=94=80 access_tracking_perf_test
>     =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 default.test
>     =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 stderr
>     =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 stdout
>     =E2=94=9C=E2=94=80=E2=94=80 coalesced_io_test
>     =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 default.test
>     =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 stderr
>     =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 stdout
> ...
>=20
> results/log file will have the status of each test like the one printed
> on console. Each stderr and stdout will have data based on the
> execution.
>=20
> Runner is implemented in python and needs at least 3.6 version.
>=20
> Signed-off-by: Vipin Sharma <vipinsh@google.com>
> ---

...

> diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selft=
ests/kvm/.gitignore
> index 550b7c2b4a0c..a23fd4b2cb5f 100644
> --- a/tools/testing/selftests/kvm/.gitignore
> +++ b/tools/testing/selftests/kvm/.gitignore
> @@ -11,3 +11,4 @@
>  !Makefile
>  !Makefile.kvm
>  !*.test
> +!*.py

Sort this alphabetically as well.

> +def fetch_test_files(args):
> +    exclude_dirs =3D ["aarch64", "x86_64", "riscv", "s390x"]

These are now:

arm64, x86, riscv, s390

> +    def __init__(self, test_path, output_dir=3DNone, timeout=3DNone,):
> +        test_command =3D pathlib.Path(test_path).read_text().strip()
> +        if not test_command:
> +            raise ValueError("Empty test command in " + test_path)
> +
> +        if output_dir is not None:
> +            output_dir =3D os.path.join(output_dir, test_path)

This doesn't do the right thing if test_path is absolute (or maybe it's if =
the
output_dir is in a completely different hierarchy?)

I was able to fudge around this with=20

diff --git a/tools/testing/selftests/kvm/runner/selftest.py b/tools/testing=
/selftests/kvm/runner/selftest.py
index cdf5d1085c08..3bce023693cb 100644
--- a/tools/testing/selftests/kvm/runner/selftest.py
+++ b/tools/testing/selftests/kvm/runner/selftest.py
@@ -30,7 +30,8 @@ class Selftest:
             raise ValueError("Empty test command in " + test_path)
=20
         if output_dir is not None:
-            output_dir =3D os.path.join(output_dir, test_path)
+            dirpath, filename =3D os.path.split(test_path)
+            output_dir =3D os.path.join(output_dir, os.path.basename(dirpa=
th), filename)
         self.test_path =3D test_path
         self.command =3D command.Command(test_command, timeout, output_dir=
)
         self.status =3D SelftestStatus.NO_RUN

Lastly, please don't wrap agressively (off-list, you mentioned it was due t=
o a
formatter?).  E.g.

diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/test=
ing/selftests/kvm/runner/test_runner.py
index b9d34c20bf88..5a568e155477 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -12,8 +12,7 @@ class TestRunner:
         self.tests =3D []
=20
         for test_file in test_files:
-            self.tests.append(selftest.Selftest(
-                test_file, output_dir, timeout))
+            self.tests.append(selftest.Selftest(test_file, output_dir, tim=
eout))
=20
     def _run(self, test):
         test.run()


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9AEF531CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 22:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GtrcgyRY8dcn3VLzUDN93WtruBuz/B9n6Ctjtr0M2A=; b=gDHNzmm0EKFgwA/DDPfJsdIS6v
	/EVkx57wZiQOODZVWULJIAnvqavV2UjMZz8lSHKFNdS73Ry8zeeHCBUSRrpzioUP/YcpgTUJWOT7c
	uHLdTuer57603pJ83euxH421CajC0vNFSVuKtHqiCiI14kn+Fm2vWNPXqDtZzBhXV23ZVm9PeWW/k
	hkiA2/gW03tLNLfuKxErqMCu5hvQZnxT8DbAsHRN3t978/BhztidsRyuXAeXFdsp66IWKJdGnlhB2
	QZQakrmrf3Bufvue6ojHqO8MAw+sJ0T+p6Rt8XcVX0S4NwSIHNWOJjCH4pFtfrpBOkOlc75Edyl1N
	RV9mQjBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPe9-0000000GRCR-3I5Z;
	Mon, 13 Apr 2026 22:20:45 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCPe6-0000000GRB1-0Hvj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 22:20:43 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43cfd832155so3368339f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 15:20:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776118840; cv=none;
        d=google.com; s=arc-20240605;
        b=ciFwQg0+VxqAfBXWYa648d7NqVxBKcEbkD5yGn2hDAg/q0Hq3a7jSw/m3fVZPNyke/
         Jg/xyRV4hG0ZQXsNdgCEWuf1rg+dC8Hyae5HMl3J7ppNcG5NyWV1C1u0yO6GdILoCT4m
         eXwQvzaa01yy1TueBzpEPwoBbUSXH25lZft2FBXVZOe+bVFWUN1fQULTf2rvEKwKCRZq
         QvBrnHDJsKemlky76858qCJrD68Th1kqct60Zh4Ixj19cJnpuaA35TFvVww6PqG2lnnk
         5qaGghgFHOvoP/vxLnqxFs7lSG7J+RAJfO53ph/2IyVSdGab2zzYEg9w/Avu5JRCmn/a
         il/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0GtrcgyRY8dcn3VLzUDN93WtruBuz/B9n6Ctjtr0M2A=;
        fh=wAmrpvvRBc/zqm3bgYNdVdWq7bid6e2jOkLNhaxsrr4=;
        b=EINLTe84akkx7/Ye3AgcwXWdTjbmIbZCrup9/yTvoN667/XXRGEWxQ+HWIPZTJ+DO8
         GMGZZsSmEPf6fxOX9qookwhcvZ4poREnUqclTQwoJoQBtC5+/38XICaIuAOsRdNEpR/i
         FyLmfQdtgsAbEFs1CdkKZnfBqgG5OPJu9jW0QwYiw68OkIfFidelQ9Z+qqam01IrNqIy
         YgMgCn1oJu0emZKntDlv1KbrDVVW47IXT2e2SiuWVfmCJr4zSL1ZwXTjJzRcZJpgLkHa
         oUd64M9l7oeSvwbZiX6uKjJI+LCxzHgSDEFqpuvGPweco83xzHj79JpbShBEdwkxtJGp
         yj3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118840; x=1776723640; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GtrcgyRY8dcn3VLzUDN93WtruBuz/B9n6Ctjtr0M2A=;
        b=GM4KqjOTCqcnX6Pp6qtcLbCxitH8CYDHF8kGvUUKfunuKXfZ/CDEIeLiJMwtvCJ9tI
         WlPVvB2EK1DB/jvxiKtaOQK6LZMqbg3ayf3PuHtLDGjnjtfBjtNrQ+od7ap5RUoyYcXF
         JmobLx0gMIO4X533fmUPuPE4jBBQ1ZZt00M8DlQISjx2RaeoecC3PwCOjFYuBNNSSiPq
         0kQZJf/aTFW3XNXVwPHNKzw4r3QdBtp3Ux2p7mauaJZPty4YAVhXMlVVfkEKn/UHlSNw
         LIc7QnURbNv0DYqE41WwC2uXCNX9Yp4oMcCDj/1NMNlmwriQAEDWWFfFM7a3GlA2bNvb
         mM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118840; x=1776723640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0GtrcgyRY8dcn3VLzUDN93WtruBuz/B9n6Ctjtr0M2A=;
        b=KVIsXUJzKkygzqAEQWsSMEKJl89sWiq/EJbhVdowMUKROel7+4CAZP08HACyrqvlH/
         I40LrVxGmLCiw9i6kkQZ7vmynYmuITwIyqp6AOUz2phSxeldmcO66+aAYSJkfhCe/2oL
         v6XG85krypjc/ATpLGXIj0neSNntZhFZL+5nHZ7vmebRZ/WS8F+9c1fbe33VV7nKGPXl
         rh17/VoR1Uivu5iSULVyVwW6cwR/SojRKTMAGslGCf2WKj2sEwSGLgjFuUJd+3WrqD+F
         1l6Lqt+ydfsUnsWkX6rZBH7HVvAHxS25kLb1aNk4kzyJCJXYcLinlbLAAjjyhG6wqF7O
         sCAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+iiPReIqerw7TBQZfSXsHMUVeb0Fnqgcg8ZBXHWG/Ne3kHWMG2NnHVCdSy2GG0GWUHAB1hBcTqX8Xlfa4awwwv@lists.infradead.org
X-Gm-Message-State: AOJu0YzfVJVIxRkRtzxGhvNrxbZcQlijD4R95O6w38oERY9QWfhNCf4P
	zH9t6n1nk9N3KrTqGP+p5lvHNO6EbGJgGPajX4KBjplulKVuqrmgevJZooOs3i3u6EC+7kSfGeF
	curMWNijgOdK9FWbH5SaQUeVZAJpo5Zs=
X-Gm-Gg: AeBDiesCqky3jNV7o6tQPattBy4qP3AMDP00V7DMocORB3YdCzhpN9ax7M3YzizGfrr
	UEDchG9WTtZ3qLM3KKpfztshQePfw1pkm4ntxpdvlM9MA44CgLeiSuT2wnUaH49amAK/LZeKG7B
	LzQLgrIcsoPWSUliu9nO5wN5X1kGUlffi7unArxM8KhCE540tY7XrlsNhEy4l10J6Ix1Z2tD0ba
	bGzjT9Zv2OUGxx3HFbKccHiWnF5Seljhzvy/nBF4XsGFUI1OQRmWuRRPide9tm2ePFb5N/SSP/S
	3D5bZbSmWyRNSiSnuak6I2PR3YN3wQXPg1OvrLHz
X-Received: by 2002:a05:6000:220b:b0:43c:fdd:ea96 with SMTP id
 ffacd0b85a97d-43d642b6e75mr20785387f8f.26.1776118839833; Mon, 13 Apr 2026
 15:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-8-1a5831230821@bootlin.com>
In-Reply-To: <20260413-kasan-v1-8-1a5831230821@bootlin.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 14 Apr 2026 00:20:28 +0200
X-Gm-Features: AQROBzC46tJ1Vulp-Ruy1LR_qNHLJczc_Mec_FX1XvbzAbvB4RmfM9pOdtpD_VM
Message-ID: <CA+fCnZekgcEgsZnRrOB=+HoG=neRg=oLTt2jStyrPJ6mYf2ctQ@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 8/8] selftests/bpf: add tests to validate
 KASAN on JIT programs
To: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, ebpf@linuxfoundation.org, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xu Kuohai <xukuohai@huawei.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_152042_261948_80608C97 
X-CRM114-Status: GOOD (  38.67  )
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

On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Foundatio=
n)
<alexis.lothore@bootlin.com> wrote:
>
> Add a basic KASAN test runner that loads and test-run programs that can
> trigger memory management bugs. The test captures kernel logs and ensure
> that the expected KASAN splat is emitted by searching for the
> corresponding first lines in the report.
>
> This version implements two faulty programs triggering either a
> user-after-free, or an out-of-bounds memory usage. The bugs are
> triggered thanks to some dedicated kfuncs in bpf_testmod.c, but two
> different techniques are used, as some cases can be quite hard to
> trigger in a pure "black box" approach:
> - for reads, we can make the used kfuncs return some faulty pointers
>   that ebpf programs will manipulate, they will generate legitimate
>   kasan reports as a consequence
> - applying the same trick for faulty writes is harder, as ebpf programs
>   can't write kernel data freely. So ebpf programs can call another
>   specific testing kfunc that will alter the shadow memory matching the
>   passed memory (eg: a map). When the program will try to write to the
>   corresponding memory, it will trigger a report as well.
>
> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@boot=
lin.com>
> ---
> The way of bringing kasan_poison into bpf_testmod is definitely not
> ideal.  But I would like to validate the testing approach (triggering
> real faulty accesses, which is hard on some cases, VS manually poisoning
> BPF-manipulated memory) before eventually making clean bridges between
> KASAN APIs and bpf_testmod.c, if the latter approach is the valid one.

Would it make sense to put these tests into KASAN KUnit tests in
mm/kasan/kasan_test_c.c? I assume there is a kernel API to JIT BPF
programs from the kernel itself?

There, you can just call kasan_poison(), some tests already do this.
And you can also extend the KASAN KUnit test framework to find out
whether the bad access is a read or write, if you want to check this.



> ---
>  tools/testing/selftests/bpf/prog_tests/kasan.c     | 165 +++++++++++++++=
++++++
>  tools/testing/selftests/bpf/progs/kasan.c          | 146 +++++++++++++++=
+++
>  .../testing/selftests/bpf/test_kmods/bpf_testmod.c |  79 ++++++++++
>  3 files changed, 390 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/kasan.c b/tools/testi=
ng/selftests/bpf/prog_tests/kasan.c
> new file mode 100644
> index 000000000000..fd628aaa8005
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/prog_tests/kasan.c
> @@ -0,0 +1,165 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +#include <bpf/bpf.h>
> +#include <fcntl.h>
> +#include <linux/if_ether.h>
> +#include <sys/klog.h>
> +#include <test_progs.h>
> +#include <unpriv_helpers.h>
> +#include "kasan.skel.h"
> +
> +#define SUBTEST_NAME_MAX_LEN   64
> +#define SYSLOG_ACTION_READ_ALL 3
> +#define SYSLOG_ACTION_CLEAR    5
> +
> +#define MAX_LOG_SIZE           (8*1024)
> +#define READ_CHUNK_SIZE                128
> +
> +#define KASAN_PATTERN_SLAB_UAF "BUG: KASAN: slab-use-after-free in bpf_p=
rog_"
> +#define KASAN_PATTERN_GLOBAL_OOB "BUG: KASAN: global-out-of-bounds in bp=
f_prog_"
> +
> +static char klog_buffer[MAX_LOG_SIZE];
> +
> +static int read_kernel_logs(char *buf, size_t max_len)
> +{
> +       return klogctl(SYSLOG_ACTION_READ_ALL, buf, max_len);
> +}
> +
> +static int clear_kernel_logs(void)
> +{
> +       return klogctl(SYSLOG_ACTION_CLEAR, NULL, 0);
> +}
> +
> +static int kernel_logs_have_matching_kasan_report(char *buf, char *patte=
rn,
> +                                                 bool is_write, int size=
)
> +{
> +       char *access_desc_start, *access_desc_end, *tmp;
> +       char access_log[READ_CHUNK_SIZE];
> +       char *kasan_report_start;
> +       int hsize, nsize;
> +       /* Searched kasan report is valid if
> +        * - it contains the expected kasan pattern
> +        * - the next line is the description of the faulty access
> +        * - faulty access properties match the tested type and size
> +        */
> +       kasan_report_start =3D strstr(buf, pattern);
> +
> +       if (!kasan_report_start)
> +               return 1;
> +
> +       /* Find next line */
> +       access_desc_start =3D strchr(kasan_report_start, '\n');
> +       if (!access_desc_start)
> +               return 1;
> +       access_desc_start++;
> +
> +       access_desc_end =3D strchr(access_desc_start, '\n');
> +       if (!access_desc_end)
> +               return 1;
> +
> +       nsize =3D snprintf(access_log, READ_CHUNK_SIZE, "%s of size %d at=
 addr",
> +                is_write ? "Write" : "Read", size);
> +
> +       hsize =3D access_desc_end - access_desc_start;
> +       tmp =3D memmem(access_desc_start, hsize, access_log, nsize);
> +
> +       if (!tmp)
> +               return 1;
> +
> +       return 0;
> +}
> +
> +struct test_spec {
> +       char *prog_name;
> +       char *expected_report_pattern;
> +};
> +
> +static struct test_spec tests[] =3D {
> +       {
> +               .prog_name =3D "bpf_kasan_uaf",
> +               .expected_report_pattern =3D KASAN_PATTERN_SLAB_UAF
> +       },
> +       {
> +               .prog_name =3D "bpf_kasan_oob",
> +               .expected_report_pattern =3D KASAN_PATTERN_GLOBAL_OOB
> +       }
> +};
> +
> +static void run_test_with_type_and_size(struct kasan *skel,
> +                                       struct test_spec *test, bool is_w=
rite,
> +                                       int access_size)
> +{
> +       char subtest_name[SUBTEST_NAME_MAX_LEN];
> +       struct bpf_program *prog;
> +       uint8_t buf[ETH_HLEN];
> +       int ret;
> +
> +       prog =3D bpf_object__find_program_by_name(skel->obj, test->prog_n=
ame);
> +       if (!ASSERT_OK_PTR(prog, "find test prog"))
> +               return;
> +
> +       snprintf(subtest_name, SUBTEST_NAME_MAX_LEN, "%s_%s_%d",
> +                test->prog_name, is_write ? "write" : "read", access_siz=
e);
> +
> +       if (!test__start_subtest(subtest_name))
> +               return;
> +
> +       ret =3D clear_kernel_logs();
> +       if (!ASSERT_OK(ret, "reset log buffer"))
> +               return;
> +
> +       LIBBPF_OPTS(bpf_test_run_opts, topts);
> +       topts.sz =3D sizeof(struct bpf_test_run_opts);
> +       topts.data_size_in =3D ETH_HLEN;
> +       topts.data_in =3D buf;
> +       skel->bss->is_write =3D is_write;
> +       skel->bss->access_size =3D access_size;
> +       ret =3D bpf_prog_test_run_opts(bpf_program__fd(prog), &topts);
> +       if (!ASSERT_OK(ret, "run prog"))
> +               return;
> +
> +       ret =3D read_kernel_logs(klog_buffer, MAX_LOG_SIZE);
> +       if (ASSERT_GE(ret, 0, "read kernel logs"))
> +               ASSERT_OK(kernel_logs_have_matching_kasan_report(
> +                                 klog_buffer, test->expected_report_patt=
ern,
> +                                 is_write, access_size),
> +                         test->prog_name);
> +}
> +
> +static void run_test_with_type(struct kasan *skel, struct test_spec *tes=
t,
> +                              bool is_write)
> +{
> +       run_test_with_type_and_size(skel, test, is_write, 1);
> +       run_test_with_type_and_size(skel, test, is_write, 2);
> +       run_test_with_type_and_size(skel, test, is_write, 4);
> +       run_test_with_type_and_size(skel, test, is_write, 8);
> +}
> +
> +static void run_test(struct kasan *skel, struct test_spec *test)
> +{
> +       run_test_with_type(skel, test, false);
> +       run_test_with_type(skel, test, true);
> +}
> +
> +void test_kasan(void)
> +{
> +       struct test_spec *test;
> +       struct kasan *skel;
> +       int i;
> +
> +       if (!is_jit_enabled() || !get_kasan_jit_enabled()) {
> +               test__skip();
> +               return;
> +       }
> +
> +       skel =3D kasan__open_and_load();
> +       if (!ASSERT_OK_PTR(skel, "open and load prog"))
> +               return;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(tests); i++) {
> +               test =3D &tests[i];
> +
> +               run_test(skel, test);
> +       }
> +
> +       kasan__destroy(skel);
> +}
> diff --git a/tools/testing/selftests/bpf/progs/kasan.c b/tools/testing/se=
lftests/bpf/progs/kasan.c
> new file mode 100644
> index 000000000000..f713c9b7c9ce
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/progs/kasan.c
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +
> +#include <linux/bpf.h>
> +#include <bpf/bpf_helpers.h>
> +#include <bpf/bpf_tracing.h>
> +
> +#define KASAN_SLAB_FREE 0xFB
> +#define KASAN_GLOBAL_REDZONE 0xF9
> +
> +extern __u8 *bpf_kfunc_kasan_uaf_1(void) __ksym;
> +extern __u16 *bpf_kfunc_kasan_uaf_2(void) __ksym;
> +extern __u32 *bpf_kfunc_kasan_uaf_4(void) __ksym;
> +extern __u64 *bpf_kfunc_kasan_uaf_8(void) __ksym;
> +extern __u8 *bpf_kfunc_kasan_oob_1(void) __ksym;
> +extern __u16 *bpf_kfunc_kasan_oob_2(void) __ksym;
> +extern __u32 *bpf_kfunc_kasan_oob_4(void) __ksym;
> +extern __u64 *bpf_kfunc_kasan_oob_8(void) __ksym;
> +extern void bpf_kfunc_kasan_poison(void *mem, __u32 mem__sz, __u8 byte) =
__ksym;
> +
> +int access_size;
> +int is_write;
> +
> +struct kasan_write_val {
> +       __u8 data_1;
> +       __u16 data_2;
> +       __u32 data_4;
> +       __u64 data_8;
> +};
> +
> +struct {
> +       __uint(type, BPF_MAP_TYPE_ARRAY);
> +       __uint(max_entries, 1);
> +       __type(key, __u32);
> +       __type(value, struct kasan_write_val);
> +} test_map SEC(".maps");
> +
> +static void bpf_kasan_faulty_write(int size, __u8 poison_byte)
> +{
> +       struct kasan_write_val *val;
> +       __u32 key =3D 0;
> +
> +       val =3D bpf_map_lookup_elem(&test_map, &key);
> +       if (!val)
> +               return;
> +
> +       bpf_kfunc_kasan_poison(val, sizeof(struct kasan_write_val),
> +                              poison_byte);
> +       switch (size) {
> +       case 1:
> +               val->data_1 =3D 0xAA;
> +               break;
> +       case 2:
> +               val->data_2 =3D 0xAA;
> +               break;
> +       case 4:
> +               val->data_4 =3D 0xAA;
> +               break;
> +       case 8:
> +               val->data_8 =3D 0xAA;
> +               break;
> +       }
> +       bpf_kfunc_kasan_poison(val, sizeof(struct kasan_write_val), 0x00)=
;
> +}
> +
> +
> +static int bpf_kasan_uaf_read(int size)
> +{
> +       __u8 *result_1;
> +       __u16 *result_2;
> +       __u32 *result_4;
> +       __u64 *result_8;
> +       int ret =3D 0;
> +
> +       switch (size) {
> +       case 1:
> +               result_1 =3D bpf_kfunc_kasan_uaf_1();
> +               ret =3D result_1[0] ? 1 : 0;
> +               break;
> +       case 2:
> +               result_2 =3D bpf_kfunc_kasan_uaf_2();
> +               ret =3D result_2[0] ? 1 : 0;
> +               break;
> +       case 4:
> +               result_4 =3D bpf_kfunc_kasan_uaf_4();
> +               ret =3D result_4[0] ? 1 : 0;
> +               break;
> +       case 8:
> +               result_8 =3D bpf_kfunc_kasan_uaf_8();
> +               ret =3D result_8[0] ? 1 : 0;
> +               break;
> +       }
> +       return ret;
> +}
> +
> +SEC("tcx/ingress")
> +int bpf_kasan_uaf(struct __sk_buff *skb)
> +{
> +       if (is_write) {
> +               bpf_kasan_faulty_write(access_size, KASAN_SLAB_FREE);
> +               return 0;
> +       }
> +
> +       return bpf_kasan_uaf_read(access_size);
> +}
> +
> +static int bpf_kasan_oob_read(int size)
> +{
> +       __u8 *result_1;
> +       __u16 *result_2;
> +       __u32 *result_4;
> +       __u64 *result_8;
> +       int ret =3D 0;
> +
> +       switch (size) {
> +       case 1:
> +               result_1 =3D bpf_kfunc_kasan_oob_1();
> +               ret =3D result_1[0] ? 1 : 0;
> +               break;
> +       case 2:
> +               result_2 =3D bpf_kfunc_kasan_oob_2();
> +               ret =3D result_2[0] ? 1 : 0;
> +               break;
> +       case 4:
> +               result_4 =3D bpf_kfunc_kasan_oob_4();
> +               ret =3D result_4[0] ? 1 : 0;
> +               break;
> +       case 8:
> +               result_8 =3D bpf_kfunc_kasan_oob_8();
> +               ret =3D result_8[0] ? 1 : 0;
> +               break;
> +       }
> +       return ret;
> +}
> +
> +SEC("tcx/ingress")
> +int bpf_kasan_oob(struct __sk_buff *skb)
> +{
> +       if (is_write) {
> +               bpf_kasan_faulty_write(access_size, KASAN_GLOBAL_REDZONE)=
;
> +               return 0;
> +       }
> +
> +       return bpf_kasan_oob_read(access_size);
> +}
> +
> +char LICENSE[] SEC("license") =3D "GPL";
> diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools=
/testing/selftests/bpf/test_kmods/bpf_testmod.c
> index d876314a4d67..01554bcbbbb0 100644
> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> @@ -271,6 +271,76 @@ __bpf_kfunc void bpf_kfunc_put_default_trusted_ptr_t=
est(struct prog_test_member
>          */
>  }
>
> +static void *kasan_uaf(void)
> +{
> +       void *p =3D kmalloc(64, GFP_ATOMIC);
> +
> +       if (!p)
> +               return NULL;
> +       memset(p, 0xAA, 64);
> +       kfree(p);
> +
> +       return p;
> +}
> +
> +#ifdef CONFIG_KASAN_GENERIC
> +extern void kasan_poison(const void *addr, size_t size, u8 value, bool i=
nit);
> +
> +__bpf_kfunc void bpf_kfunc_kasan_poison(void *mem, u32 mem__sz, u8 byte)
> +{
> +       kasan_poison(mem, mem__sz, byte, false);
> +}
> +#else
> +__bpf_kfunc void bpf_kfunc_kasan_poison(void *mem, u32 mem__sz, u8 byte)=
 { }
> +#endif
> +
> +__bpf_kfunc u8 *bpf_kfunc_kasan_uaf_1(void)
> +{
> +       return kasan_uaf();
> +}
> +
> +__bpf_kfunc u16 *bpf_kfunc_kasan_uaf_2(void)
> +{
> +       return kasan_uaf();
> +}
> +
> +__bpf_kfunc u32 *bpf_kfunc_kasan_uaf_4(void)
> +{
> +       return kasan_uaf();
> +}
> +
> +__bpf_kfunc u64 *bpf_kfunc_kasan_uaf_8(void)
> +{
> +       return kasan_uaf();
> +}
> +
> +static u8 test_oob_buffer[64];
> +
> +static void *bpf_kfunc_kasan_oob(void)
> +{
> +       return test_oob_buffer+64;
> +}
> +
> +__bpf_kfunc u8 *bpf_kfunc_kasan_oob_1(void)
> +{
> +       return bpf_kfunc_kasan_oob();
> +}
> +
> +__bpf_kfunc u16 *bpf_kfunc_kasan_oob_2(void)
> +{
> +       return bpf_kfunc_kasan_oob();
> +}
> +
> +__bpf_kfunc u32 *bpf_kfunc_kasan_oob_4(void)
> +{
> +       return bpf_kfunc_kasan_oob();
> +}
> +
> +__bpf_kfunc u64 *bpf_kfunc_kasan_oob_8(void)
> +{
> +       return bpf_kfunc_kasan_oob();
> +}
> +
>  __bpf_kfunc struct bpf_testmod_ctx *
>  bpf_testmod_ctx_create(int *err)
>  {
> @@ -740,6 +810,15 @@ BTF_ID_FLAGS(func, bpf_testmod_ops3_call_test_1)
>  BTF_ID_FLAGS(func, bpf_testmod_ops3_call_test_2)
>  BTF_ID_FLAGS(func, bpf_kfunc_get_default_trusted_ptr_test);
>  BTF_ID_FLAGS(func, bpf_kfunc_put_default_trusted_ptr_test);
> +BTF_ID_FLAGS(func, bpf_kfunc_kasan_poison)
> +BTF_ID_FLAGS(func, bpf_kfunc_kasan_uaf_1)
> +BTF_ID_FLAGS(func, bpf_kfunc_kasan_uaf_2)
> +BTF_ID_FLAGS(func, bpf_kfunc_kasan_uaf_4)
> +BTF_ID_FLAGS(func, bpf_kfunc_kasan_uaf_8)
> +BTF_ID_FLAGS(func, bpf_kfunc_kasan_oob_1)
> +BTF_ID_FLAGS(func, bpf_kfunc_kasan_oob_2)
> +BTF_ID_FLAGS(func, bpf_kfunc_kasan_oob_4)
> +BTF_ID_FLAGS(func, bpf_kfunc_kasan_oob_8)
>  BTF_KFUNCS_END(bpf_testmod_common_kfunc_ids)
>
>  BTF_ID_LIST(bpf_testmod_dtor_ids)
>
> --
> 2.53.0
>


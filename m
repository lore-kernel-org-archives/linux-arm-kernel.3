Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D0BC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ttgwH8UHuDsbpe+g+LIC07zUw8mgYUjByGb6XeD0sc=; b=cFjahMYHitouevpJ9AeLv/jZEX
	FtDRlyr3UqpvzgRVNJrP2Seh5gSooY9BbxsD47QaOifqtxZHJvnFvwuPO5HqYpwoBUVU2PIPz9nvZ
	kRPoKfc5w0vf3y6ur65jc3sOt7WyWMdaX4yPhsWVP1UtjoJfSfHQFLx+zR8fyIeHRDJc9ZcmmviXv
	FXS33hMnEp9U17rkPtQgdI3QYgMuu60jz8YmASh17lLwpkhWk6rJ2SdI2z0yiZ8KvgZpyEEvyahoQ
	5rkY6KuTzaI8zxWEHlAwR1NAR0Aw9nrkjKY3du7I8O6WlgdhEYM2chsSvbIj5eVpNNiQVB98B1KdG
	nbjuipfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q7P-00000008v0R-3uPN;
	Wed, 23 Sep 2026 16:46:52 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q77-00000008uwN-0u6R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:46:36 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso860582a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790181992; cv=none;
        d=google.com; s=arc-20260327;
        b=awDpK8mAyyv6Mc54qT0dBUYxZ4A2cfbsfMfkPQXRS990hCbWkhyfuJ1lklCpeEhINO
         tPFyVczmBBp1KYGNxs1/bwRmkoXIFLJsowAUmsnNDKlsk4pbKWviD/+7DVMl21OjyXOF
         NNihhqOECAJa6G3C1dcv0PKPoS3WUj5W0GUOZZP/7aNuxSTL/e1YaiexTPPN7xqlofur
         qqu4AVrRC1SpntgBe1LhMRUFk8S1oOrH9E8ceI2kMBkHfOuOFhjOm+NVBdOQ0xY52cig
         8USOFrCRwXNZbRhIXghSA4kqm3Z8q8K0J4N/KK6ZcP1tLHK5Mlz9gmnB8gsWmjAQHVxu
         SVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ttgwH8UHuDsbpe+g+LIC07zUw8mgYUjByGb6XeD0sc=;
        fh=6zpiEm2OSNsZ9PxiidLn9yTeJX0uui3qvf/7cY6LGtk=;
        b=PkM1idj2SvIl8G9+3kPQOgqw6rMsIQzVlP5FMaROlG5VOzQ6en+UkXfqQQoflKeXb7
         A7X7fHHefPgzlKeaLX1uIM5ZElvl6Y2JIK7EPeXpRIMDuvTRJipn524KRS768XPQbhSD
         1m7Qix42XhvqOKpjVjvUh9vN0Y2OOJqd/BxuVuuqvKg3seEvjXDG1rr2sVJrK9DBe2kk
         mbpWpwg1pRNjXtNdcZnslygmTXwiBF+8eI8THC4ynfq4QxSE/2cyclM29+crCjexMpH7
         iUNj9XiIgrlmgC9pP3mur7ziaHz4GE0lsK0jbhgjHfRgQYJsftZbnDU8hgnGYoA1XHFd
         9PwA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790181992; x=1790786792; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ttgwH8UHuDsbpe+g+LIC07zUw8mgYUjByGb6XeD0sc=;
        b=YfnI0nYYfbivcv3bdLDcDlQka9ifAVApsRaXQ4qRul67QvFgkmdDQfepC3mNjzX8Ta
         7wZE7AIuoIXACV+OWLy6cCTZ2XtzUdx0yR5d2FeatNJdS+PNYsBpHVt5iNFJRqqkALjM
         zaENGj64mkhg+q4pgj2EoBC4RzgooOKpylrYq5DkNc1CkhcCE+3z5XyA1eaZBzrvxABy
         aP8Q5P6sEzxWKi2j7T9Y+fu4wECJfizvdq8NMqIz3BbyJQ05dBM5BZQVxgiWlwScoki0
         2IlhoPwU0erVNB+O9bKfNFzPak6wslvBQzrYkxqGhogg/bLBxLVGe5wTDE/ZMA2wheLh
         oXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181992; x=1790786792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ttgwH8UHuDsbpe+g+LIC07zUw8mgYUjByGb6XeD0sc=;
        b=rhYjt9WNTP651I+x6GXncmZmOFgzav/CHHVkCxqV9kahE8+vQdp2QI0gP4q6Ub9Kas
         3+q7YitgFcXdmfAtr0Cu6ZV2qV1CrxMulX7dGb6Sdn5u05rmsqNqQd37phoDnKv0ZLxE
         qU0wWrvQVw6pn9bgz6CKsghXw3wyOOo2R1Ti0+CoDGUEKxTKLtudrSHwdxHPHCahIuyQ
         gYT1p+kY/KD4GWkJo/R9Z1DoREL37tbnX7/sJw22mjC2xLIX/Jz5X8NAbe4cdglxoR+k
         row6NJuOMTOvOFNTykc3vZuQjXsAneXKtOfZwx8ZLFV9jjeq2AMebHcHeOxW8CUIdBlq
         B1Iw==
X-Forwarded-Encrypted: i=1; AKwUvBy5imf5oNvinvM6U/TZx44w/WEpYBSSJH525QVfPq8bU5rCRaUVMWwK+sT6hBUDHpon9fGYMg47J5Fc0kca71KA@lists.infradead.org
X-Gm-Message-State: AFuF++kDKxjjAQOvQgUaYlrrOsYrz4K6S69ekK6CszN2PJueP5GNS6Zb
	/28DzNi4sDCEgmU1+Je+PemEmfV3GtVBdOD+iQSpLrky+bBtqkUN7/RZm5ODGHQVhm1FxHIey9F
	QDTkifjyThkx2nLKaXrvFCoAJdLtiVFw=
X-Gm-Gg: AYBFou2JBhIGxVbgFR6nOISl0gkCrduElutiCsMSDWP1phOpNJFqbcnGCB8+Y0KcGEy
	/x3VsNfRaE4e9HdgU7kaYVauFwiTQXQ9D3iZj8NTwkOvP9t4kFHaLBs1ZMW+GTIuZdWTrcE8R6/
	OW7ZPpYEcgBS5Qpy+w7ISIzLuY0RO5+bHFNV15h88YTaKXzLlIlJsS417vfByk1WWqMUIOpkpFT
	5JcunTPh3xwMzt0TjTkFOw1WxQ5orLQFrFdMowhoxRDRCTB+x+kuoq1XK/Ju8Hv0GGfNnHQQlt7
	YckIW+P1U5WKT6yWcyWOX9QBMHNvZW5hy3Vbp7wH/L9eV+uMt8kNOCzAcwraWxAJvCxav99nlO2
	lsjDeIs4z0lsziYbxMpe4t432rvZ9DFGCD512
X-Received: by 2002:a17:90b:2742:b0:39e:4c7e:f03f with SMTP id
 98e67ed59e1d1-3a07e5808demr2908153a91.28.1790181992225; Wed, 23 Sep 2026
 09:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260810164622.1829843-1-puranjay@kernel.org> <CANk7y0ixo5a3Vfzj_HVhVHRNce2Rsit4pP27GCtXd4jHHzmiKg@mail.gmail.com>
 <CAEf4BzapC=7YM2QLMyKKfyOWGgBTfEJmPPN8e9Jf5xT9SutBTQ@mail.gmail.com> <dfa8362e-0dad-4f23-9d2e-dde03cb5facc@linaro.org>
In-Reply-To: <dfa8362e-0dad-4f23-9d2e-dde03cb5facc@linaro.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 23 Sep 2026 09:46:20 -0700
X-Gm-Features: AcwNN1UoxvmW1a-b3T0PDtkRMDhPQq20k4NzNgV-SyDiYVuDhWZJEV9Emssz7sE
Message-ID: <CAEf4BzZ=ahQNtA-1KdZFRONXMOEkV9Nb1OUY==JRQCarkbMM0Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] arm64: Add BRBE support for bpf_get_branch_snapshot()
To: James Clark <james.clark@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
	Puranjay Mohan <puranjay12@gmail.com>, bpf@vger.kernel.org, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Stephane Eranian <eranian@google.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif <usama.arif@linux.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_094634_226593_A4AE5118 
X-CRM114-Status: GOOD (  28.55  )
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

On Wed, Sep 23, 2026 at 2:15=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
>
>
> On 22/09/2026 21:40, Andrii Nakryiko wrote:
> > On Tue, Sep 1, 2026 at 6:45=E2=80=AFAM Puranjay Mohan <puranjay12@gmail=
.com> wrote:
> >>
> >> Hi James,
> >>
> >> Can you review this version of the patchset? It is implementing what
> >> we discussed in the thread on the last version.
> >>
> >
> > James, do you mind reviewing the patches again, seems like Puranjay
> > went with the implementation you suggested, would be nice to review
> > and ack, if it looks good to you.
> >
> > Mark, Will, you guys seems to be designated as maintainers for
> > drivers/perf/arm_brbe.c, can you please take a look and give your
> > feedback as well? This is important and useful feature for newer arm64
> > CPUs, it would be great to get access to this functionality that we
> > had on x86-64 side for a long while now. Please help get this upstream
> > or, if it's not in the right shape, guide Puranjay towards a better
> > implementation. Thank you!
> >
>
> LGTM, and the Sashiko review is good too. It does conflict with the
> FEAT_NMI patches on the list, and you'd have to disable NMIs but as it
> stands right now it's ok.
>
> Reviewed-by: James Clark <james.clark@linaro.org>
>

Thank you, James! Mark, Will, do you have any suggestions on correct
sequencing of things and how we should proceed? Thanks!
>
>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEFAD2FED0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 18:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dOOo8NQ4DafD9XkbSs1ACU0adhfNmtPmDSYYCT0h1M=; b=vxnjSki9lylHD8+dYeK0Lw+Qhq
	4bR9hu8YE+xVndr4+rprItm2FwJM04IFyPO+UqEU2tUSzA9em0tEjLfIDHIcP+khoXxHDaLMPHFY6
	VnTtvvOs7iF1sYQE9TzZvlNGnulodjxrlo8yFweQSEmLLBc4anpNI67nhLzuvVuHfenP2A0ShD2NE
	E1lpPNVPlisbht8St6tjSG3ewyU12NsjPkIyR+IpMY0vf4+51B0+8E2pqU9xnehPagzT2oxFjzoNi
	r4G34836qwjDcus7sHIaj5X06jpna+AFzkBzuILyrYF8wFohqzb9QZplIYuq+Ek1Az9p5W7GW2QXf
	AXkDIS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknUd-0000000EmfW-0CjI;
	Tue, 27 Jan 2026 18:08:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknUa-0000000Emee-1PTP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 18:08:45 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a885af8ee7so2355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:08:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769537324; cv=none;
        d=google.com; s=arc-20240605;
        b=CAizR5NfPMaJYOkoqvGklECrjBwc75k/TgaEqndHgkdTQBhI/LDQPyZgTgPI3UD7Kz
         WNAgPa6W47nVnaLPTpz+4d6Wq+29M+4xcSaViMJq3Pmg8dJb8Sn0zSxgprjUqfYlX3bz
         UgfSlaM+v0V5R7hzHXkTsNXXPFzHwC68WRn/dDZWML/cbsBMP3XzGmyO33ALwPXxyZkI
         EF0doW2zPNGPKEXKB5LkibZf/qRDdwZxGNj5xtPoDJUFFz9qThGdwBhuTUw+CVdDs3P0
         UosCX9an9lqZzexx0u8Ya6A0T+jeNVpLeJURM9PsU4YrhmhBnBaNq2b40jUiH9TH/yOm
         yn1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1dOOo8NQ4DafD9XkbSs1ACU0adhfNmtPmDSYYCT0h1M=;
        fh=bO2d00J+WMP/8mFOLUuYUixR8XWMZFrgIf5al8VUqEI=;
        b=HraQHpuIsZmPVpJVBoI9XKG2BqT3NTeMp4UB0VD81DpAT8m0LTDQdsCpcw2/cVXHu3
         Ak0MuHb+cHTARKvwOtl1l/q9dNNPkQBlMW1sfZMKKE6TpT433DX0h2nyG8UD0ijhdS/t
         DDqNdJnEl04Dlmr59nW6IIsXq8VPIxsd75licWW9Dpym1CG9dmXoIt6HPh3z4j2XAO9M
         1TVXctqlXh+hDedeMjlqEDXEHPQNGmcZqoiGiGkb1pHHzYypf0mZpp5/6E1T2KpAT35Q
         zMY7GPZXLv9E/kOjvKx5VQx5yapvyS5Ui/53LDiGbhvZ2UZmZWkz9oJTjw8LUO1zSITY
         w2DQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769537324; x=1770142124; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dOOo8NQ4DafD9XkbSs1ACU0adhfNmtPmDSYYCT0h1M=;
        b=p5xM6yWTjQ3ly79SKh19ehH4888MIBk4AWgkx9qI3xT7OoQSR03N7XrVMurKNDQlY5
         A1bt9xWvzsy33VEP9Acmzh705OWqeGBGeMMpxzFZdImHcYjDKhUvDYw3THrUm0pQvZYK
         SKk1K3ilkNdSThSYPiJgGFiOmRem3Gwx3kwFkTOY9AXIaMde3cO7Ry6qVz38gZSoaa6z
         uPJisWFDGEJCnKrQgj7O3stdsQ+c/g4/foFtTcbvA1qLaHs5grPLkZWgZXBXe2mjQVYa
         bhesTGV/7sUZ7J7AjtxKX9tq2aGFAHvkqU/U3/rTAv3a1HR42tnNTYlO8KNdbPm2OjDg
         yGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769537324; x=1770142124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1dOOo8NQ4DafD9XkbSs1ACU0adhfNmtPmDSYYCT0h1M=;
        b=QUnx6/UNVrgXwjIDKFzO6xX2knfg4u3JEqDJh85AZZw/EVqg+5oS3egj44o0/jyP/1
         l2fAUtG+JSbYI6SfKH8ojsaMEKwVZQ0kltY2EJjgAxzMOfu8DrHwteJtp+XyIEsAkrbI
         3qhtoz031ssKQTbxf55Z9Zj7hUQsozj2z0ZiKK3+6LR5PcwJRosgsjKKyjPiEiz81BRy
         LpCyMKIq0/JOT0ikxH5VpddTPR9/eHMrqTH1v89Wp585VXMf/f1+KeSU59T8eYUeEQfE
         XLeqCdUJxkuTZghT1Koo9CBpm8Ko70bFV5DjfTgzc7DMVB0N9uDAtuo5JH0mRQaL6Am5
         bnMw==
X-Forwarded-Encrypted: i=1; AJvYcCVHDPOX6N/R9Z6NXkDcKV4STZjd5O6NI+3Y72f7GLv1EYKNiApvcOo8pE2fbeqR5HKJfbOeUrJtxAX0o+sLV2aP@lists.infradead.org
X-Gm-Message-State: AOJu0YxP73Zhzo9Ryd2X3HBtktPvLRGzOVcqbuEeJ53tAvu1Zk98A26q
	EErFSAQaROS41RT+gx+mN0r/pAL7q/oNOKLhQPD+70YoI/W5d6McZpm/Un3RpjATHbTt0xcXJfU
	Wiw+RyPyLH53GAjRW0NIEf9/0qwBo7Y6VOcR0JH03
X-Gm-Gg: AZuq6aKZW4oWO0U6Z1mNIu/s1qqeAM1/3a3ceb8LeWDgT6iqbGkXBNQ5EdlRB2low2e
	e6x3INRNCL43D4DwDpq8U3qqvFktUjL5AaPMBtp5HvztHlYvBBEZf3W/PU0tC/zdPys+pRtW6Ph
	v2I//F/IqMgbrDlj/cwqZvBZ2yxspx7smot4K0s4b3+atst2LTB3EAp8uy+ndryGrj3+HWYs4eq
	8vp+7SGNN8SCSE9gGe3MA5M0L0Se6ot/nbpglfdbgDvuQFW3D5PGmlbdpgqHqUGh844hmwGS1cS
	R4/Urnqet9oYWNieO0nDRpQu
X-Received: by 2002:a17:902:d583:b0:2a7:6fd3:c11e with SMTP id
 d9443c01a7336-2a870b4f72fmr2715565ad.18.1769537323122; Tue, 27 Jan 2026
 10:08:43 -0800 (PST)
MIME-Version: 1.0
References: <20260117052849.2205545-23-irogers@google.com> <20260127174253.396766-1-serhei@serhei.io>
In-Reply-To: <20260127174253.396766-1-serhei@serhei.io>
From: Ian Rogers <irogers@google.com>
Date: Tue, 27 Jan 2026 10:08:30 -0800
X-Gm-Features: AZwV_QjigoQ4qTMNcTX7ebCm7Qdj2jAHNjthD9J6xiq7M99DqRJBY5IBrDFTDXk
Message-ID: <CAP-5=fWFXnmZZ2vh_oJM6PWYiJvOV1Etx1+FLzWQUhv7WYC6jg@mail.gmail.com>
Subject: Re: [PATCH v1 22/23] perf unwind-libdw: Don't discard loaded
 ELF/Dwarf after every unwind
To: Serhei Makarov <serhei@serhei.io>
Cc: acme@kernel.org, aditya.b1@linux.ibm.com, adrian.hunter@intel.com, 
	ak@linux.intel.com, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	atrajeev@linux.ibm.com, ctshao@google.com, dvyukov@google.com, 
	guoren@kernel.org, haibo1.xu@intel.com, howardchu95@gmail.com, 
	james.clark@linaro.org, john.g.garry@oracle.com, jolsa@kernel.org, 
	krzysztof.m.lopatowski@gmail.com, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux@treblig.org, mark@klomp.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, slyich@gmail.com, 
	stephen.s.brennan@oracle.com, thomas.falcon@intel.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_100844_381503_744E4AB7 
X-CRM114-Status: GOOD (  24.02  )
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

On Tue, Jan 27, 2026 at 9:43=E2=80=AFAM Serhei Makarov <serhei@serhei.io> w=
rote:
>
> > As removing the dwfl didn't prove possible, an alternative is to just n=
ot discard the dwfl when the unwind ends. The dwfl is valid for a process u=
nless a dso is loaded at the same address as a previous one. So keep the dw=
fl with the maps, invalidate it if a map is removed (in case a new map repl=
aces it) and recycle the dwfl in the unwinding code.
>
> Relevant note:
>
> I'm looking at whether elfutils libdwfl_stacktrace might further help wit=
h these issues. The libdwfl_stacktrace library is currently shipped as an e=
xperimental addon to libdwfl in elfutils 0.194, but I'm intending to stabil=
ize the API this year. There's code for some analogous functions: translati=
ng perf->dwarf register files, and caching Dwfl and Elf data to speed up un=
winding across multiple processes. (Thus, if unwinding a collection of perf=
_events from 16 processes that use libc, we don't need to load the CFI for =
libc.so 16 times.)
>
> I think once I've stabilized the libdwfl_stacktrace API and expanded the =
register support to a larger set of perf-supported architectures, it makes =
sense for me to author a corresponding set of patches for perf. I'll see if=
 it's worth adding more libdwflst functionality to elfutils 0.195 in antici=
pation of this.

Thanks Serhei, this would be really awesome! I've done my best wrt
trying to optimize around libdwfl, but I wasn't able to have a single
dwfl for the addr2line case with a dso and the stack unwinding code.
Just to give too many details :-)

With addr2line we have the dso and an offset into the dso of some
point in code. We want to get the symbol for that address and inline
information. The "bias" notion in dwfl was something of a speed bump
in writing that code and was broken in an early version:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/libdw.c?h=3Dperf-tools-next#n133
Just documenting libdw/libdwfl addresses better to say whether a bias
is or isn't necessary would be useful. Walking the inline information
is also (strangely to me) done outside of libdw, which makes me wonder
about support for things like partial compilation units:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/dwarf-aux.c?h=3Dperf-tools-next#n147

For the unwinding:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/unwind-libdw.c?h=3Dperf-tools-next#n407
I experimented with failing each unwind step so that then I could take
the return PC, make it an offset into a dso and reuse the dso dwfl.
This breaks many asserts in libdwfl and so I gave it up.

There's also the use of a dwfl for type profiling and probes in debuginfo:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/debuginfo.c?h=3Dperf-tools-next#n55

For making the code generic we needed mapping functions between perf
and dwarf numbering, as well as number and string mapping. A problem
with the generic code was that if a register was encoded that libdwfl
didn't support it broke libdwfl. This led to clipping the registers:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/dwarf-regs.c?h=3Dperf-tools-next#n157
but this feels like code that's going to bitrot, cause elfutil version
problems, etc.

Something I noticed is that there was a reduction in crashes from
0.192 to 0.194. I'm a little concerned that people may package perf
without updating elfutils and witness crashes because of these recent
perf changes. Hopefully distributions will move forward to 0.194 asap.

Thanks,
Ian

> -- Serhei Makarov


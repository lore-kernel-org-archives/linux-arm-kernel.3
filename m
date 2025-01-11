Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4D5E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 14:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2lbfOGB8gg7wUXgcCKWwEjh/GIQdeP4KglNFtDE9I8=; b=Ats3od18YTxYcAS54vK5UrFtH4
	nZu5MBhAFe2UL6kqfzkQ6E4RGGLwc6qLycy7mj4hLVC931UEp68S1j5WnR3equx2WvFFLesdc2vvM
	psCB/YGAhEhDcm81Pk/90//SlA28JmM3kJnL1wxjvOqmbZCvDDl/nvGWnsiF2SWbNrijoi6mn1g0I
	u3Iky2Qb5CVdOdcHKxgSxsnxDQd7F+/RCzgC7CBomdlCa8/bf+cr9fhc6xGH9PLqH8XIbQi4LDthI
	P4E60dIcsZOA9Fzkx3fSj76GWiOl93av7dKjZ3Dgi5Ksroq6BNriZqeIT4EGyNS6kOeE6HOx4VNfM
	yzHxs86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWc7j-00000000tI9-43GB;
	Sat, 11 Jan 2025 14:05:59 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWc6V-00000000tAI-3JFs;
	Sat, 11 Jan 2025 14:04:45 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50B7PNME000920;
	Sat, 11 Jan 2025 14:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=J2lbfO
	GB8gg7wUXgcCKWwEjh/GIQdeP4KglNFtDE9I8=; b=lzAOD3IHOM+LF+0a5FCa7Y
	bADezBvhwGwklBA4suWH6lgpbqO1H4Gtdvf9a4WwyOuV0djj3mU4v5JBzC4QSwjM
	wrx/9ymlxvo3VLali/3cEoUQzq/6innMi3v7uRENscc855giXs3sP/JQfMyITdsW
	ytDjgjXk6w6TVMvupMAuAfiVGJOIsLYblVdno/WfOl7xS1aQvccyj+n4I6ma0LkA
	2pWkF3RrBglyT1kotvcwRu5fsKDl+82NR6Olmsf4KgWWd4855f/PBqXrb2JruOnH
	eUmfaEG++S+q5swlGz8blYUTSlyA+03MD8xV1uPRhp4FSzdPoujt7be2YMvSn5FQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 443e2nhxjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 14:04:16 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50BE4FWv022141;
	Sat, 11 Jan 2025 14:04:15 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 443e2nhxje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 14:04:15 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50BALm66003572;
	Sat, 11 Jan 2025 14:04:14 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yfatqk76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jan 2025 14:04:14 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50BE4CcR27853066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 Jan 2025 14:04:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D45802004B;
	Sat, 11 Jan 2025 14:04:12 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E1BA20040;
	Sat, 11 Jan 2025 14:04:00 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.242.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat, 11 Jan 2025 14:03:59 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH v6 00/16] perf tools: Use generic syscall scripts for all
 archs
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Z4EyD_RgjjeD6G4K@x1>
Date: Sat, 11 Jan 2025 19:33:46 +0530
Cc: Charlie Jenkins <charlie@rivosinc.com>, Namhyung Kim <namhyung@kernel.org>,
        Ian Rogers <irogers@google.com>, Hari Bathini <hbathini@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
        =?utf-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
        Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>,
        John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
        James Clark <james.clark@linaro.org>,
        Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
        Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org,
        bpf@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <721EF5C4-5B22-4654-8328-F3616CDD1D29@linux.vnet.ibm.com>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1> <Z4AoFA974kauIJ9T@ghost> <Z4A2Y269Ffo0ERkS@x1>
 <Z4A8NU02WVBDGrYZ@ghost>
 <8639C367-2669-4924-83D8-15EAFAC42699@linux.vnet.ibm.com>
 <Z4EyD_RgjjeD6G4K@x1>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4t0XeC8NVubnR-Ul2Eg3y8vjelW9NEDY
X-Proofpoint-GUID: ih83BF0cpgnFHXX9AyELYSHOM8UwQ-Qx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501110120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_060443_958782_CC6D5093 
X-CRM114-Status: GOOD (  17.61  )
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



> On 10 Jan 2025, at 8:13=E2=80=AFPM, Arnaldo Carvalho de Melo =
<acme@kernel.org> wrote:
>=20
> On Fri, Jan 10, 2025 at 12:34:46PM +0530, Athira Rajeev wrote:
>>=20
>>=20
>>> On 10 Jan 2025, at 2:44=E2=80=AFAM, Charlie Jenkins =
<charlie@rivosinc.com> wrote:
>>>=20
>>> On Thu, Jan 09, 2025 at 05:49:39PM -0300, Arnaldo Carvalho de Melo =
wrote:
>>>> On Thu, Jan 09, 2025 at 11:48:36AM -0800, Charlie Jenkins wrote:
>>>>> On Thu, Jan 09, 2025 at 12:59:43PM -0300, Arnaldo Carvalho de Melo =
wrote:
>>>>>> =E2=AC=A2 [acme@toolbox perf-tools-next]$ git log --oneline -1 ; =
time make -C tools/perf build-test
>>>>>> d06826160a982494 (HEAD -> perf-tools-next) perf tools: Remove =
dependency on libaudit
>>>>>> make: Entering directory =
'/home/acme/git/perf-tools-next/tools/perf'
>>>>>> - tarpkg: ./tests/perf-targz-src-pkg .
>>>>>>                make_static: cd . && make LDFLAGS=3D-static =
NO_PERF_READ_VDSO32=3D1 NO_PERF_READ_VDSOX32=3D1 NO_JVMTI=3D1 =
NO_LIBTRACEEVENT=3D1 NO_LIBELF=3D1 -j28  DESTDIR=3D/tmp/tmp.JJT3tvN7bV
>>>>>>             make_with_gtk2: cd . && make GTK2=3D1 -j28  =
DESTDIR=3D/tmp/tmp.BF53V2qpl3
>>>>>> - =
/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP: cd . =
&& make =
FEATURE_DUMP_COPY=3D/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_F=
EATURE_DUMP  feature-dump
>>>>>> cd . && make =
FEATURE_DUMP_COPY=3D/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_F=
EATURE_DUMP feature-dump
>>>>>>        make_no_libbionic_O: cd . && make NO_LIBBIONIC=3D1 =
FEATURES_DUMP=3D/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATU=
RE_DUMP -j28 O=3D/tmp/tmp.KZuQ0q2Vs6 DESTDIR=3D/tmp/tmp.0sxMyH91gS
>>>>>>          make_util_map_o_O: cd . && make util/map.o =
FEATURES_DUMP=3D/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATU=
RE_DUMP -j28 O=3D/tmp/tmp.Y0Mx3KLREI DESTDIR=3D/tmp/tmp.wg9HCVVLHE
>>>>>>             make_install_O: cd . && make install =
FEATURES_DUMP=3D/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATU=
RE_DUMP -j28 O=3D/tmp/tmp.P0LEBAkW1X DESTDIR=3D/tmp/tmp.agTavZndFN
>>>>>> failed to find: etc/bash_completion.d/perf
>>>>>=20
>>>>> Is this something introduced by this patch?
>>>>=20
>>>> I don't think so.
>>>>=20
>>>> BTW this series is already pushed out to perf-tools-next:
>>>>=20
>>>> =
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/l=
og/?h=3Dperf-tools-next
>>>>=20
>>>> Thanks!
>>>>=20
>>>> - Arnaldo
>>>=20
>>> Thank you!
>>>=20
>>> - Charlie
>>=20
>> Hi Charlie, Arnaldo
>>=20
>> While testing the series, I hit compilation issue in powerpc
>>=20
>> Snippet of logs:
>=20
> Yeah, Stephen Rothwell noticed it in linux next and Charlie provided a
> fix, so I squashed it all together and will push it soon:
>=20
>    Link: =
https://lore.kernel.org/r/20250108-perf_syscalltbl-v6-14-7543b5293098@rivo=
sinc.com
>    Link: =
https://lore.kernel.org/lkml/20250110100505.78d81450@canb.auug.org.au
>    [ Stephen Rothwell noticed on linux-next that the powerpc build for =
perf was broken and ...]
>    Link: =
https://lore.kernel.org/lkml/20250109-perf_powerpc_spu-v1-1-c097fc43737e@r=
ivosinc.com
>    [ ... Charlie fixed it up and asked for it to be squashed to avoid =
breaking bisection. o
>=20
> Thanks for the report!
>=20
Sure,
Thanks Charlie for the fix

I tested on latest tmp.perf-tools-next and compiles fine

Tested-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Thanks
Athira


> - Arnaldo




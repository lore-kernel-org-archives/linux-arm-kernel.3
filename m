Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4055C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 14:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JT9l/+e3r1Y05jUzOsZqr8YD8XUbFvoCajdKIzKQ9jU=; b=dN77FlZIbEqXuMazQnuev7Q/eF
	QNs4DmGZ61rZg7UYFcyXy5DpnsQ7sOgOm1XJ/3l3GKq0Q09Bwm2009owmLs0gGqSM67mLWp3x5TIc
	tREIa5EsqTkSG2Xg6pOP/+PLstS2ic8wI60h26VcFZX02UwGjbkj1zJ9TqvXcoZI9HMUtEAR4M1VN
	8/s32gzzOrIjVO/FH6K2XjrAzQ+8Wd2u11BTI6XmxOo/eJU93o0IFEjhrpSTRPLUXlgwA84mQQI2c
	qo2DYXp35+fYYL/v+C/TpXOjE8OJ5bhDN5v4ELcKTOFVpuzDkWDtsBAOohESt0d2mYBbGaNlAmtAq
	D/FCgxrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xfQ-0000000EP78-2MMD;
	Thu, 24 Apr 2025 14:35:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wms-0000000EDLU-1oz1
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 13:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Subject
	:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JT9l/+e3r1Y05jUzOsZqr8YD8XUbFvoCajdKIzKQ9jU=; b=Ka4dK6AksvFMJb871BvS+bcdtw
	zu+TuPRMq1yVqTHpS1SmM1TVQmH6Ck0f2/LpjxK4gGBHxNH6wevVKo2Awd5obBEFY/ltVqUGdBwXp
	4zlaLm7f9faTBrxgzRX+l+KyWrlVr+LgiPMGPWvILXMSueZAVPUGSQjKn9vCFwwHOnmGKyuZ6TZAt
	xReWeDW6wZXSp/XLOINeMte3tEZsKXKvHLkl67wBOutlZzl8Iyu6RpeMRG1aXS79gPELfhAqdqdRf
	0H/4WG7ploSftCh/ljWcbHPfdKgucBEbhDl1eW5tMKVx9YTZvB4f6kRX7JcDoG8soKurnGXmceZnJ
	qCOZtcJg==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7wmp-0000000Bnnf-1MBl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 13:38:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD20543A18;
	Thu, 24 Apr 2025 13:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745501918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JT9l/+e3r1Y05jUzOsZqr8YD8XUbFvoCajdKIzKQ9jU=;
	b=gI9Qi8iAoHo/gBxh9R+vG0T3VpMLo5YARKDaRzoVfMvD3Kkj1HD5Uvt33GjFv5WHHyIurg
	ECYtVZKxvk99eb/wdY73MvgT6BzLddjF5SjDB51Tw5uNtdrI33XtLLs80gHarB744Bkjc8
	DWrmSkphdd1Al/1SSUT7QCcJtagYi/1cUE7+PJ4EEaJDPM57AcgG2SDDwq8/AKzS/+FWLy
	kwRznWKkWuxRt2VhPK65YLXmKWOid1ZPnDfDQYQF93h6yR1YeZIAcY73oWHtOV17t61Y2q
	E2lW9ycVZgB6kUDduFAin8Sbas/RVeP+GBA5ls/GR2BGECqPv+IEs2bEhMpV2A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Apr 2025 15:38:35 +0200
Message-Id: <D9EWSDXHDGFJ.FIDSHIR1OP80@bootlin.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "KP Singh"
 <kpsingh@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>, "Hao Luo"
 <haoluo@google.com>, "Jiri Olsa" <jolsa@kernel.org>, "Puranjay Mohan"
 <puranjay@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Mykola Lysenko" <mykolal@fb.com>, "Shuah Khan"
 <shuah@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Florent Revest"
 <revest@chromium.org>, "Bastien Curutchet" <bastien.curutchet@bootlin.com>,
 <ebpf@linuxfoundation.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH RFC bpf-next 1/4] bpf: add struct largest member size in
 func model
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, "Andrii Nakryiko"
 <andrii.nakryiko@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
 <6b6472c3-0718-4e60-9972-c166d51962a3@huaweicloud.com>
In-Reply-To: <6b6472c3-0718-4e60-9972-c166d51962a3@huaweicloud.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeelieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefuhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelkeehiefhfeehvefhtdegueelkeehffffffeuvdekkeekuddvueeguefgieeukeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepgihukhhuohhhrghisehhuhgrfigvihgtlhhouhgurdgtohhmpdhrtghpthhtoheprghnughrihhirdhnrghkrhihihhkohesghhmrghilhdrtghomhdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopehjohhhn
 hdrfhgrshhtrggsvghnugesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_143843_479113_552B70C1 
X-CRM114-Status: GOOD (  14.38  )
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

Hi Xu,

On Thu Apr 24, 2025 at 2:00 PM CEST, Xu Kuohai wrote:
> On 4/24/2025 3:24 AM, Alexis Lothor=C3=A9 wrote:
>> Hi Andrii,
>>=20
>> On Wed Apr 23, 2025 at 7:15 PM CEST, Andrii Nakryiko wrote:
>>> On Thu, Apr 17, 2025 at 12:14=E2=80=AFAM Alexis Lothor=C3=A9
>>> <alexis.lothore@bootlin.com> wrote:
>>>>
>>>> Hi Andrii,
>>>>
>>>> On Wed Apr 16, 2025 at 11:24 PM CEST, Andrii Nakryiko wrote:
>>>>> On Fri, Apr 11, 2025 at 1:32=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Fou=
ndation)
>>>>> <alexis.lothore@bootlin.com> wrote:

[...]

>> Thanks for the pointer, I'll take a look at it. The more we discuss this
>> series, the less member size sounds relevant for what I'm trying to achi=
eve
>> here.
>>=20
>> Following Xu's comments, I have been thinking about how I could detect t=
he
>> custom alignments and packing on structures, and I was wondering if I co=
uld
>> somehow benefit from __attribute__ encoding in BTF info ([1]). But
>> following your hint, I also see some btf_is_struct_packed() in
>> tools/lib/bpf/btf_dump.c that could help. I'll dig this further and see =
if
>> I can manage to make something work with all of this.
>>
>
> With DWARF info, we might not need to detect the structure alignment anym=
ore,
> since the DW_AT_location attribute tells us where the structure parameter=
 is
> located on the stack, and DW_AT_byte_size gives us the size of the struct=
ure.

I am not sure to follow you here, because DWARF info is not accessible
from kernel at runtime, right ? Or are you meaning that we could, at build
time, enrich the BTF info embedded in the kernel thanks to DWARF info ?

Thanks,

Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



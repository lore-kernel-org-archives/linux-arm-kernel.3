Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEFFC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 09:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqZ0WDpd3UCnsiyB13GsKoIcLdHmxLRzaHRSKG1EEsE=; b=x8VR74lqeR3IRBCXjZ6kMgsPzW
	Znsb+XlTPgeJz49wXgk36+DrV1J1dxaOZN5SMz/0oe+dNqbxPRS6hydeRG02jvuernEa99757pale
	lFmtaoVKpfrrT4/43qq8qM/06MRkwPLj5UZ69Yl3sZgYENGouG1l8VO9yLIx+hVrBfw+HQwz2jaWk
	D228+VoOguXhXvn7cGhumsfxGw0FUPcDOFAASWdU9VTSw45uL73T3Rg6YLFi+PKyGgKk2bK7+N/3L
	H9ySS26KO/O0TggxkepUPEQ2pcJDR1y/npAjP46ybKKVA/qdJ0cNgSuHH4vnaT+nn6SSMnLFNtAnk
	StvviI4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hcR-00000009CeU-0Qf9;
	Tue, 29 Apr 2025 09:51:15 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9haU-00000009CPW-1BwK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 09:49:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 656F74328B;
	Tue, 29 Apr 2025 09:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745920150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tqZ0WDpd3UCnsiyB13GsKoIcLdHmxLRzaHRSKG1EEsE=;
	b=BaZ8t7kO9QR35XhfDlLfJAdORCV3aUUi29DxhEffSeC4/qO92hJbYxjDTNjWePj37YQqqF
	qGV6UZvx7sYqEEapQ2sJNm8niEkNvhO1YEYSUYaDBCnaRPwA/+XiuSdXFeCM0VFFeU/bQY
	63jcFp8qOHYMrHQAugG28HWTCZ2mKc9+ShVrmzLnKjnShPn3uM5fl9OcmuIovrkmIk9dnB
	+mgoGULFSg3PqOsylSrO84e2Aq1HJ8dM5/81jemh5xyMQ8O6QnGTO/ieBXvFUb2f2tyJxA
	AscSm/s01ycVbb1sJuvhgTwL7GxTNG7mEqCS/+UO/dOKPnWJJyxUsEMvUKnq3Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 11:49:08 +0200
Message-Id: <D9J11FERN5K4.1OUFGN6L9LM9E@bootlin.com>
Subject: Re: [PATCH RFC bpf-next 3/4] bpf/selftests: add tests to validate
 proper arguments alignment on ARM64
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Eduard
 Zingerman" <eddyz87@gmail.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "KP Singh" <kpsingh@kernel.org>, "Stanislav
 Fomichev" <sdf@fomichev.me>, "Hao Luo" <haoluo@google.com>, "Jiri Olsa"
 <jolsa@kernel.org>, "Puranjay Mohan" <puranjay@kernel.org>, "Xu Kuohai"
 <xukuohai@huaweicloud.com>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Mykola Lysenko" <mykolal@fb.com>, "Shuah
 Khan" <shuah@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Florent Revest"
 <revest@chromium.org>, "Bastien Curutchet" <bastien.curutchet@bootlin.com>,
 <ebpf@linuxfoundation.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-3-0a32fe72339e@bootlin.com>
 <3a16fae0346d4f733fb1a67ae6420d8bf935dbd8.camel@gmail.com>
 <D9I6TQN2I6B1.QC4FFHEWAURZ@bootlin.com> <m21ptcmdnw.fsf@gmail.com>
 <D9IKA5K8PFAO.21V0PXVU6VPF1@bootlin.com>
In-Reply-To: <D9IKA5K8PFAO.21V0PXVU6VPF1@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkuffhvfevofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetudfgvefhveeugeegudethffgvefhleetgfeijeejieejjeevgedtheegfeekhfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomhdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopehjohhhnhdrfhgrshhtr
 ggsvghnugesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepshhonhhgsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_024914_468300_6DF37DDA 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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

On Mon Apr 28, 2025 at 10:41 PM CEST, Alexis Lothor=C3=A9 wrote:
> On Mon Apr 28, 2025 at 6:52 PM CEST, Eduard Zingerman wrote:
>> Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com> writes:

> If things really behaved correctly, f would not have the correct value bu=
t
> would still be handled as a 16 bytes value, so the test would not fail wi=
th
> "actual 35 !=3D 43", but something like "actual
> 27254487904906932132179118915584 !=3D 43" (43 << 64 | 35) I guess. I stil=
l
> need to sort this out.

And so indeed, the broken value is a big one:

(gdb) p skel->bss->t11_f
$4 =3D 793209995169510719523
(gdb) p/x skel->bss->t11_f
$5 =3D 0x2b0000000000000023
(gdb)

But we see the 35 (0x23) value in the error log because the formatters used=
 in
ASSERT_EQ truncate the actual value.

Alexis

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



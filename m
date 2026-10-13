Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37497CC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hCU9eM+EAM+gbO2WZ1UL5JdVd2fGYoXa+LQjApjQ9A=; b=yJh/9qF4SBz+08ooDT+4EGkMro
	Bp3jBG42UO+zMyUFaV1fLZ0Z9RZSv5u0PYm8WEAhYAU/oSA4UnFZaMRyNjvTuDMRiFOtsVB8kSYvl
	lzUxzUt0wTrm6wUG4/ODWa254qREYTDMqfZmenBpry11CXkpcMnwaESZyy73wJjsWNwnQM4UFG5P9
	+ULcxXdy6ISINuVXN1/oaiz1j0yCDGBVwS1I/N7Eg8hRX7VpDAwU4FQ7D61o8J9gtVi682ND1ja01
	DV5SmfrRhtpM3yldiPty5aBsc+TUrvLrwc6CPrW2mmmzA0HFu5qJjtKcvR2z4M4ZR7q5alPFATRaw
	MVV4/11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcgm-0000000Cxve-25SC;
	Tue, 13 Oct 2026 13:37:08 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcgk-0000000Cxv1-03NC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:37:07 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-93e56c287b3so237281085a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791898625; x=1792503425; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/hCU9eM+EAM+gbO2WZ1UL5JdVd2fGYoXa+LQjApjQ9A=;
        b=njbOPFbLJqflIJv9qXvMGsipsBJh9Q9r4Gb4RmODQGBWxG+pqaSl11pHWoZ8UAZaUV
         LRXrRiiGvCdtDFW11/6DsmsLu+WW//Xrm+Sv3oYwm2jlyw7OD6FkH2shE3DPEZvG3V/D
         19zVbi9JnJV79ElbT4/jmitpvk2QKqNvU0iUhqIoPxjdmrOoDDhY92ZwhPRnc5gT147A
         hVlamHs5zFTAyNwFbcb7B6UMdMyj6CO2RnjoOxrIt3UWBF+UbHuZ18rHqm2DO8Fl6ctY
         MVg5253ujxvYPAvCtRG8NXRg/pxlVHtFA8DTZhP+9B3j0n0cKwZTUdYyIp1plBhK2NJG
         1+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898625; x=1792503425;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/hCU9eM+EAM+gbO2WZ1UL5JdVd2fGYoXa+LQjApjQ9A=;
        b=2nUMONN3mU236QuWkT79dpKMRgylDNtyQ1a5H8INt/BTsXS6UYBqXJauJhSrF1I1Ut
         18cLom9ezNLBLHknOTu7j5RfqjM1iqSYKtdL3cH/6ZkKVZgPSQ/iVB8cP/KjXoeaxuS3
         VCbrcSPepcgZhqvH1TePTRpkpmiRWsLMuNMBF4WcqPAxcF0DFH5CFBq/kmAOwcjcwSc4
         Wh/wVyvcadVMXQQrhdhfxJPB+AmIktKdy47pynBaQNjwnjXe2a37JRO9vDesjJTLt5lQ
         3rnC47AeaAZzy0kkGko0rBvIKE4IxzWQDb3rDe1xEDOFLpVTmvDrgszBcHnlQQPL9NT6
         GlVA==
X-Forwarded-Encrypted: i=1; AKwUvBxSQp/4YP406KPzU6ft7FzEYkr/thiaa/A2GP1jVVwH2Xp+Rr3VU0cktILuDujvCS99n7uyLpbR922Z9SDmOu+W@lists.infradead.org
X-Gm-Message-State: AFq9FYL4yZGxG8zY62u6rLsTuFEjVMoJDz5znIhAE/PAw6gv+KPLCZP/
	qXIKLbCx1d8dEiOnfYkgkVpmZ9Rse/FV02y1JPSmyxJh5KLHw9AcUXvsZhbYKb90yao=
X-Gm-Gg: AYBFou3GG/jy2PQWVuvQ6atv5Jehu5NtWWF3Kw8Pz5M2lpUUNJXGQPqKipQni5VjCEF
	8hV7yUAU6A5Jb4ysdzEOV/fn1V7XIWpuaSoUwpkWp1c0a//NnLYBtOzKSUoApavILbcE/+/B7vI
	vHr1zkC7lnCveOp8hyCf2s9IgbP4hUbrdrozDNAmFk8GCA19ZXL0q2iXhCh5a8PMjJTlSBSHCy2
	o+A8Oqb/OZAe2YKi0dTEYHqbvn393ZPbdVeqw+lAE/barAsmbuB7022mHzchdt2WGiYTzPllevM
	m9ckTpggA8o+JBvqRrDzaar0xReL5NQR1kcOqxFOZvO4WkLShtuI6ouTaMrTh9rTNaJS5qT2+Vd
	tifFXrOQ+Vbw4jzwaE266p6KqhJqxhyd/STgz/RUwF7FIflWG6b/uUWRnEVm4cNzNcDUu3saBS2
	5gFfHitRGZXfX9gFZnqYx8AQyQOdrqzK3jl4qi7Hq+PdKrQRyiiiciQrx4mzDbU7nTs53aejXHf
	oVFNQArjen8XdxG58121nZltVXDE408WHQggjo6Sfa66r+gxdx8l47xUPeLhX4B2IE=
X-Received: by 2002:a05:620a:1a03:b0:93c:ba44:673d with SMTP id af79cd13be357-93ebd1b7173mr2238297585a.23.1791898624601;
        Tue, 13 Oct 2026 06:37:04 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50295a7sm238844085a.23.2026.10.13.06.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:37:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGcgh-00000009eSN-12xH;
	Tue, 13 Oct 2026 10:37:03 -0300
Date: Tue, 13 Oct 2026 10:37:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: GONG Ruiqi <gongruiqi1@huawei.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Roberto Sassu <roberto.sassu@huaweicloud.com>,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Eric Snowberg <eric.snowberg@oracle.com>,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Dan Williams <djbw@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>
Subject: Re: [PATCH RFC 0/3] security: ima: support TSM measurement registers
Message-ID: <20261013133703.GJ14213@ziepe.ca>
References: <20260930-ima_tgx_integration_v2-v1-0-722c35370548@arm.com>
 <ebe68f6463f8ece8a5cd8ce70bba292ec4f64a41.camel@huaweicloud.com>
 <c4fe5315d70fc162f1e5648e3fccb1676710d5e6.camel@huaweicloud.com>
 <ar5tOUor0bp3MtQ6@e129823.arm.com>
 <9e74ff9d-e8a3-425e-bf7c-f973d06e6cdf@huawei.com>
 <as3uzQ7L6tJ-Lu-Q@e129823.arm.com>
 <1451a49c-f37a-486f-ac47-e2ff86fef28a@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1451a49c-f37a-486f-ac47-e2ff86fef28a@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_063706_058739_6CEB1B50 
X-CRM114-Status: GOOD (  14.60  )
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

On Tue, Oct 13, 2026 at 09:05:37PM +0800, GONG Ruiqi wrote:
> I'd rather not base our work on Jiri's patch at this stage: it is
> a pre-RFC draft of the new attestation subsystem, whose design is
> itself still in progress. Building upon it instead of current
> mainline would be quite risky — we would be rebasing on a moving
> target, and merging would be blocked until the whole framework
> lands, which is realistically far off.

I'm going to be strongly against any work to try and put a ROT
multiplexor into IMA. This is architecturally the wrong direction and
is clearly very a short term project that will expose uABI that will
be difficult to unwind later.

If you want this to go faster please work with Jiri.

> I'd suggest we develop the proposal on current mainline, and
> switch to the new attestation subsystem once it lands. As I
> understand it, for us that is mostly just a matter of switching
> to a different set of APIs.

It isn't, one activity is moving the policy and ROT multiplexer into a
shared subsystem, the other is building a ROT multiplexer into IMA for
only IMA to use.

Jaon


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6E5606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZZbeNwgm;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=YggroFkc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KQ70MsaDZXGGg9xwr15iwDR73QEsKB18yX4p0CKZSM=; b=ZZbeNwgmct54C3uWRIXfs1rkRa
	NirBaiIoxxBInVNrLmEHrgP0yHuXWf/irY5vrNLhRSGNIVBhzPWwbAjaTEd7blZxItJNASev08BvS
	pn2qyQxV+75IGBbuF+A6DC7KHihaNx0pW/WVm15nlVmoi1BsYvxzOY8R1/nhTshCxzsb7lj6sUkx/
	scT0Sr2/QdyWzoeHKlIqvC0Ckov4XJubX+SU19id7qpLUeubgV4JbTdr2hEAPeqiC+A6tlcyD6NEx
	XfyifHTXKH0obwsQDrnlg5hgsaMXbAQIaMu1Vqt4WZBJxSYyMdtyBv9OVhaoXPmKr2z6+Ai3jFtBp
	Mmrujz6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAxt-00000009y4Q-1bdN;
	Tue, 20 Oct 2026 14:37:21 +0000
Received: from [2a0f:4ac0::3a11] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAxq-00000009y1X-2EZ5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:37:19 +0000
Message-ID: <7e59d984-1c00-4414-aa45-3092491ac39b@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1792507019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/KQ70MsaDZXGGg9xwr15iwDR73QEsKB18yX4p0CKZSM=;
	b=YggroFkcCadfQfVG8niIpNsyieORHWjFzYJGR4w/M8tD1eH9iDKWbMHv5Jgf+IwlrHxLJB
	usD4/MSGgmm58e7uu+YwBIbmwpP1nLJ/M2O1xRpIi05kCSpf/p72CvGX11rD3GHaQbT2Eq
	oetmXAEU064lrnsbFA+yaG0sVJJyMwU=
Date: Tue, 20 Oct 2026 16:36:55 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] arm64: Apply existing Apple CPU workarounds to M3 and
 M4
To: Marc Zyngier <maz@kernel.org>,
 Michael Reeves <michael.reeves077@gmail.com>
Cc: Oliver Upton <oupton@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Myria Sarvay <myrialsarvay@gmail.com>,
 Yureka Lilian <yureka@cyberchaos.dev>, Fuad Tabba <fuad.tabba@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261008-apple-m3-m4-kvm-v1-0-7bb4cbf3d63b@gmail.com>
 <20261008-apple-m3-m4-kvm-v1-2-7bb4cbf3d63b@gmail.com>
 <86cxtk2utm.wl-maz@kernel.org>
 <CANpmGNv4uYRLALMLKZn-HJwTiqJO90Fx23DOO7K7d-PfSWn=2w@mail.gmail.com>
 <86bj932ssc.wl-maz@kernel.org>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
Autocrypt: addr=yuka@yuka.dev; keydata=
 xjMEZ3vnnhYJKwYBBAHaRw8BAQdAn6RVMnaxLzmDDx+J3jSUGY7BqjyDhsWhdwKBSI6QpXfN
 Fll1cmVrYSA8eXVrYUB5dWthLmRldj7CjgQTFgoANhYhBPGINbLQ3ypM7JNhigKbtnC7kwpH
 BQJne+eeAhsDBAsJCAcEFQoJCAUWAgMBAAIeBQIXgAAKCRACm7Zwu5MKRx1qAP9ToLaOMd73
 VVf1JdwoMc5G44OZfKNk/+ezt9Dl2oqZdQD/Xvgd0lytU3BZ4WnYeMNzo2xHeRxXmX+MfXhA
 D33tzQ/OOARne+eeEgorBgEEAZdVAQUBAQdAIs9uImfvgSCnJOcfvzshLuaSRJ/a0Vp/9rUA
 eBGZq10DAQgHwngEGBYKACAWIQTxiDWy0N8qTOyTYYoCm7Zwu5MKRwUCZ3vnngIbDAAKCRAC
 m7Zwu5MKRyW9AP0dBOuwgWso+QjBZUsbuEmGGUz2OWtszs2Yb7087RMerwEA3al6E7vqq0HC
 7LiB3nisU+xqQojJ4n/fWCu70iEkjQw=
In-Reply-To: <86bj932ssc.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_073718_816437_22C96940 
X-CRM114-Status: GOOD (  13.57  )
X-Spam-Score: -1.3 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/9/26 10:16, Marc Zyngier wrote:
> On Fri, 09 Oct 2026 01:03:57 +0100,
> Michael Reeves <michael.reeves077@gmail.com> wrote:
>>> I can provide the binary (and a few scripts) to test this easily.
>>> Should they have been fixed, we can always create a second
>>> implementation list to cover the PMU.
>> Can you please send that so we can try? That would be much
>> appreciated, thank you.
> I've sent you (and Yureka) details over IRC. If you need help with
> setting things up, let me know directly.
>
> Thanks,
>
> 	M.


Hi all,


sorry for the long delay on this. I needed to get my testing setup in 
shape to be able to run the tests with the limited amount of I/O I have 
working on these devices.
But I can now confirm, that the following SoCs reproduce the SEIS 
erratum (produce a host SError using the binary sent by Marc) unless the 
MIDR part numbers are added to the has_broken_gic_v3_seis list.

The affected SoCs are:
- T8132 (M4)
- T8140 (A18 Pro)
- T6050 (M5 Pro)

So please add those to the list for v2 of this series, and probably also 
add T604x (M4 Pro/Max) and T8142 (M5) since I doubt they will be different).


Thanks,

Yureka



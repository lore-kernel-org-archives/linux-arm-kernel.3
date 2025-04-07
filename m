Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9047AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 09:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXVnyYZ2BcK24UjtsZeOKwEmhM+VYm+slcB3WCTfcKE=; b=NyeynWLqo5XcOI8u4xw3JYl7Q8
	ZhWcEXQBQIZ5r/sm7ebZdoj6GyF6kn4be+dxvG+S1mNEN61mVYTDK3AwFPHU2E0sYB3K00MOu2oKN
	8pZhHVvAU0re4tSZ6k6ENX19h6LgOkOt7cFK1wP9XnctzmDTTW6svjVF9WSYPJtbudjpj/xyfMZdr
	ia3y9Gm6rydYPAxURUJ9S9MNIWFePwLXbgnjo7EXpiJp5sQJ5KrMyCZNfcjA9U8L2em34haxd2NsW
	le2nYV5cOOhoQpYytTXiesEyB0BwJtI7G7J6km+M/AsLBm5JOMm1NLynW7uzylQDpscrTc4akgxTV
	fD95FVtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1idf-0000000HAPx-1Y3J;
	Mon, 07 Apr 2025 09:19:31 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ibu-0000000HA22-0jSc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 09:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744017441; x=1744622241; i=markus.elfring@web.de;
	bh=fXVnyYZ2BcK24UjtsZeOKwEmhM+VYm+slcB3WCTfcKE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PDj4qvNT6VBaWmkX2q3DXbDivd9GQUo7Pc5DwaEBDczDxElE92X+WBeWdqsMnICu
	 Tfhim6ldfMEQGBQZ2+OspldJ7UHOfxDQ9RhA59gKtKe51RFJBx0E8qTk5/YUikJ/p
	 KjoY/40WpdWY/emBVraNAKae3S4SQEI9wOZnHpmT0zNijTeUxIOEGKFSt4njoTY4v
	 5VgCiq3/akCixGsWXt1Z/hA0kLZDumpNp7ByZjyV1R4L/897wHvZsVy/A2uprIhCU
	 fImnzhMGM9IJIP156lSGahMbbR3hlRjF4MMKCxLT7EdzspB52gFTpCc21zO2Tdvq+
	 hKmz8yiIt6IGB5CJ6w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.4]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N7gbY-1sx7kh1FBK-00wGw4; Mon, 07
 Apr 2025 11:17:21 +0200
Message-ID: <e23e7566-fc04-46bf-9d77-317d8a23c146@web.de>
Date: Mon, 7 Apr 2025 11:17:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, asahi@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Sven Peter <sven@svenpeter.dev>, Viresh Kumar <viresh.kumar@linaro.org>
References: <20250405061927.75485-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH] cpufreq: apple-soc: Fix null-ptr-deref in
 apple_soc_cpufreq_get_rate()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250405061927.75485-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:HFpgaG3Y83cljGQvayNhWLmLMgaKy9NE39RP228CGSUU5E/0Y8Y
 UaizXSpqLlB5h1T/i+EFDKsXgbY4ZE4+h23eapPXDfKvPDfeZ3XVky/ZX6hOekzgqjsZQfJ
 J69RPVYhUutyCeZihLPYFRTVgigYhO7qPb4FItMfnqtNGGCZus7K+muKDHOMEawBH32dq6X
 rZwBlPgZf6a7DNbXOt3Gw==
UI-OutboundReport: notjunk:1;M01:P0:20z4uXMhqt4=;G/EikhJIvhLDD2AYSrqiRmLM2rw
 UoZcyiuBUqWx80NRPAb8n6MixxN2z1yq0o65iCbD2YQNCidUvdL17rKiJ+6ws10yg+6ziejQf
 WErYmmUM716lNyXFAu/n5CbCHbVUefVU+owSP7K06OG2UFMEVLod4LfVUXLef8GHofT4y+Zxl
 KrZhpKG9e/6XST3Fvq4tUgYVNmgJHHh9zOtD9pdDLnh7rTD2iTKYAo1rEOwQS+CJpCnOG3kLG
 a3ZDpq0iewKuVe2ouqVJtPU6jCdeA6KM/I6u7qgKwwzG0xUAEufLR4isLPrnA6TIea6N6MdVi
 cYpZGBEKpVGmPUHSjPUtO9rJa1Ci6g7aqjJ9ZQrkF96hUh73DgQhv2EGtlGg/AbCJyCv5SAtT
 Cgfro8zQWKAChb9AWiRJFingr+7MMFcZDYcuHuAtsyx34QnR8ze8FdacsPifvmwupCh61Cq5H
 IPQdjwAvustdEeQmA6EPZt/SFTMO8dauzbOpmJ3wDXlO5A82nfSSJyge/QxwfY+JuJdb/6ErU
 /RWEQheCmsyQ2UAWLruyinzv0mpA8vy7BoCGZGQm1bdpsBX0FsQmK09aj1iWDtxdSwRIOaTzQ
 Doq+AyekjowH+YKedkE2sV2znTqSg3oQYMJ6k+zh1d4B8e3CP4JUg76v9P1jLeSaLxBcTiLIj
 h7/UUO3qgRwir/FqhMloK7Bry3zBMrGXaonlasTZ3+imSeZq1kKKEcAqM/OxTZj61+fvrpdyW
 +aj37j9Qd4EZGTfl5W0t5P0DJi/6bTppYqKerqdAw9hWPTmJrEPjQjUo2T/dj5W8Mlpzc8CJs
 /fF95LpCfipn9CuDBwWtvCbomY/Za0mWu97g6PSiUFDAj8BcuuIYTKXErtMhkVLAleWz4YqJO
 AjEhrmfXIyini9IoBS62eE//R0vpuwEocOTxaKtP+AB5TslQb16hcAi8scLtFHV0vCeKT2NQ6
 kVrQ/RjQpSo6DXdq35EOs0KlxMHLI5klokQaE0hrb4gp+kCn7WsjsBvEl0zeRiRGh1fN3A8NR
 Oo3s8qYjR2d5h8kuulZLUk/vyRUNCjaDljz+40658gA2L7wM6nfzYHYTSZG9hoyCE2TAa4duW
 FHlyuvyn+mwPy8oGduKH4DQLGTLNe+PzFGzs+4GcOqm2l5NV5zhqk9Kwg/WCZHIY9QGr0Zk2L
 gVE6LBlh4iFngHCDnq4wnngYGmKCiAViGbtN0PsGI39KIC2MAuDPKFY2LrUF02XXqdGGyCjFb
 aoxEoshX5XwFeXVFdVlF+N3VEReWDpvjMO7a7VGuESQRcfqSpq3r9s/ic4z97oErjUrhTCApa
 KYIawPlYJIqhv0jamWaqBXQBo3HfUj1vh9yIRvmm85Vqwa+RX4VI3Kmd0FvevBZAfMrxHSGfN
 CN1MQX9VF/EWuQvVXDrRL5uVTDzE/cvmHBQ+DgmGwkpy9PH2HvJIt+5FxWlK0Dn9yIQb2HNO2
 w0/Z2OCMXCV1uTIPCYnVekGN88c0HWbthL9EerqI2nmd4Vpej993VT46zreVMLQt0wAM2nA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_021742_530886_6E068E9B 
X-CRM114-Status: UNSURE (   4.32  )
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

> cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
> in the policy->cpus mask. apple_soc_cpufreq_get_rate() does not check
> for this case, which results in a NULL pointer dereference.

See also once more:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.15-rc1#n94


Can any other summary phrase variant become more desirable accordingly?

Regards,
Markus


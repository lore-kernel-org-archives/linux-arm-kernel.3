Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA40D29DE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 08:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5MnEb6E01UjiCSwvv6dgm9BmEt7uX+GvbMRSazEiEo=; b=rcIikyYPB52nxKK/joKQdfJMIY
	aC3Dtk3jGrc7njQYgfClGx8ttSQVNEeq79jySYCd5Yv0PFj3Iq3rqYEy9Vr4oOvljKvMUis1rUVWz
	kzPR3LqCZXzhx2TRXgYAUy9w4GJXA2m21xdtOIlDg+/X3OqDpcghfvMHraZ4Cz+1Ws7kWCVZsQhvz
	h7sZFh5/9qwAmXJeuFv612FQeRQqbgkMWId4ZBbVyAQ33ifoAmlNQqziNlq3qota1PA1yCiZfjaMp
	OjcgaZ1oPPAHXBF9jQxwRUjXmdIvVcl6TnuGTubhUfLJeZG2QRopE58aFMV1KbhwU6mqJ6q8npNcw
	Z96XCBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZLJ-00000006hGW-1ek6;
	Tue, 13 Jan 2026 08:01:35 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZL7-00000006hEu-3S7w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 08:01:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42fbc3056afso4141924f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 00:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768291280; x=1768896080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5MnEb6E01UjiCSwvv6dgm9BmEt7uX+GvbMRSazEiEo=;
        b=UR08slaHtu6EAW3KouQ4S6YbjcE6/EuebDNteN1lnvq4kXt013NfxLAbRL1Ix1nFsj
         rmd9gPw0ciGePDecEUJJ0r5xtfydl+m9WtnEzJQNjeMN4fEkmgbrtcgUDpjddhwqwuLS
         d6jhdyKKkrSMfDpuNtVK0bCMM+vo1jGySfcdpSeEApqWPsHLLiUQYoAhRnW09gPyolq5
         OcYN1kragmCxdQoyElTP0RW2N+JO7zz9ehQoTs7RQiTD+cl2bZC3B0rBB5ijj2a1ExLM
         6R7JAMAoVVYBr8cVSCaMcb72+seU8QVgB6ykYR96PnUuORG6Agm1P8/brj/ZrE/LIHuA
         ZsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291280; x=1768896080;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G5MnEb6E01UjiCSwvv6dgm9BmEt7uX+GvbMRSazEiEo=;
        b=o7RUtt18vEXDWK4zY/tYk6H4cp55TJHytcq488wwJkzNRHoPEl7KtvyygTDuhjNCFd
         6gIZ9JJRBrruhsu29Mf7v7hE54f7ITtOSuFgu1FQUOawkjxC44MefKjApA60Lpv6firJ
         mhBo5HwMkC3Akzxc+Hdw8oU22PCuuGDI4oW9cU4vK6QTX7kOWAoFsMm8QvBVHmR6+K4H
         E7uBl4GXrqr25zY5dvwqYZHqaJE9/erbajEkw5YRh/2365su5so4oLyONElBG1uC3huc
         CohNoCnCwg3JuAWqnto/8YvfJ9heYmpuvtPV0K7iA2yjCu4iqeeAvvVEwSuQpoPFIlkh
         UfVA==
X-Forwarded-Encrypted: i=1; AJvYcCWUZFv2ZeFz96XG0mgJzX6Ff0zx1cPD8FQfzu84/Rqf6WuynWjqIG5snwZdmzscaYxH5s6Gj/f/153JzFOcQ7ZN@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrhbm+3UrzMLSPQoIJsnC6saAENQKryHp0NrDo8jYYHGCLtBJz
	ykuL8yMUnPBCNf3j5Dd9nf3A7bOkyPy9cgDj1WRR4juGRjOhZYlQYoIGBIQSe5o6C1Y=
X-Gm-Gg: AY/fxX4kkJfknJ2fPb6NQLAFsg3TifV9ARElx8ct5D24W9Nu2zBZ4QawZVC4EmsjxKB
	GNUmyA45Dq7QmtwjZTw6XhLF5s7iLWQJ3o9u1RDe1PE7BY3mroeQmDaH3gM21/cZu0EqPU4KmdH
	S4yNTK9ncMMl9ywkqvi/wxb6pcpdx/Uqvrgqn3msrZpHJugS3oXQqfsc7A5SfQO6h3oaqQOC/Sk
	qd00WQVZzt8SOJ74ce6kzLEOY/ISBfaY9x3ZPeyGBs5LErE9yDgAzi2Zau1kBSPSSqi4S6m/NXb
	P4QYlDXt7K4TxNRNkSjS9txE3kZ3wHjmfYSq0TsGOffwCGtFBM5WmVI9hQm/Ptb5XiqcjIRWH2k
	FoHXEpvCslMrfLa7Go60bRR46muzsN0eF5QU5sPxMw2gcE7iAw5ZHC28FRraqQnGnJ7OfeLdQaR
	F1pd5QQNBc4HUo9AZxv58=
X-Google-Smtp-Source: AGHT+IGHLs8CVfsENLu/dr7C4nqib/pKnwfhtjt984l0Huar4cDZxsByF4l3i43Kb2BNmKNHxXR6bg==
X-Received: by 2002:a05:6000:1842:b0:42f:b65c:1e4f with SMTP id ffacd0b85a97d-432c3633fb7mr24584880f8f.17.1768291279770;
        Tue, 13 Jan 2026 00:01:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080::e97c:97dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432d286cdecsm29024032f8f.7.2026.01.13.00.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 00:01:19 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nick Xie <xieqinick@gmail.com>
Cc: nick@khadas.com
In-Reply-To: <20260113012527.40725-1-nick@khadas.com>
References: <20260113012527.40725-1-nick@khadas.com>
Subject: Re: [PATCH] soc: amlogic: meson-gx-socinfo: add new SoC id for
 S905Y4
Message-Id: <176829127917.3573380.8250706225560973295.b4-ty@linaro.org>
Date: Tue, 13 Jan 2026 09:01:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_000122_314201_5CB442CB 
X-CRM114-Status: GOOD (  10.45  )
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

Hi,

On Tue, 13 Jan 2026 09:25:27 +0800, Nick Xie wrote:
> Add new definition for Amlogic S4 S905Y4.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/drivers)

[1/1] soc: amlogic: meson-gx-socinfo: add new SoC id for S905Y4
      https://git.kernel.org/amlogic/c/31fce0d2b13e6a4a12c9ba016e961418f8c82e34

These changes has been applied on the intermediate git tree [1].

The v6.20/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil



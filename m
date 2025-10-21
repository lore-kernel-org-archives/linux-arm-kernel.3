Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903ABCCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nw12B7KdWN/wbxxijDvUQZ5OrO1aWstBkEoWMIB2hXM=; b=5AMnpsl6i9JDOlAEzYTGQV+FCo
	3OAonndEZYCWjeBdflvu4WHOc6051O3y1VEfLVf2zHmUSPBd46F5dkOxe1iaiLl7qRdMvcsIQ/nxl
	2creKsrVSryJlU+4OL4oJ15l0JL8a72HrKohN25xCKLjpy5L1qMzNuv0LovpicRSzMLgn8nQcTql1
	MC3hFg+bAEYddXf0YLg9EMN3FedwC6QDQNO3S+VHPLzewRgNhE9l8+TGKm/I70/BG4k4OQMj6MF95
	50tsD31ZtEnt3oLIHkFioCKG0tpbT/K1SQlfHHvLLcvOBK6aug1GZuVz1YaUl6L/iADTmOyklSk27
	q5QqDe7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBUs-0000000GyXb-0WiU;
	Tue, 21 Oct 2025 12:29:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBUp-0000000GyV0-0Hb8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:29:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47117f92e32so36485545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 05:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761049785; x=1761654585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nw12B7KdWN/wbxxijDvUQZ5OrO1aWstBkEoWMIB2hXM=;
        b=Mm28XCfaQypUwvNCm/hTp7uST/H6s9o1y23ZvaYMYgQGELxh9Cm2sygCr6g0lUAnfQ
         f3CXzYRSrErCrR2U+L1hmWJg9XXlvyX5VzJ5oNgf7ivOWlsclnf9Yjv7ytk5GITDpUtk
         k9kYdKBVejWuVl8Y7qjAzkvFoMMRrm2xSKhQuBwVGU5DLm4beDwOs7BGDgNDiglE84kd
         Q8wEkjXN03AzSlpz1uHBSmqYEOrimKN0l/bZ9TRdg+hj0erI/C/D4XkZ5CO/tu8CwKa9
         y2ZGI29cFNsVk2cqEbBJazSfJf54U6dzyv2d7EtZ7JhgFs8DXOo94FS+knRd5XdQ+brN
         lgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761049785; x=1761654585;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nw12B7KdWN/wbxxijDvUQZ5OrO1aWstBkEoWMIB2hXM=;
        b=uSKzXkJYTKd1P7vHpwY5GP807KMd7cIGMb0isYPvk22XAEmeReGc2SgmbYitmSSnW6
         uaQoXxpaRN7eqvsm6rmEv0y58ckiUURy5orTEkO9KUXcMg/HOrAQTT5AMVbeQRGaSxlQ
         vhUpS2PezzFAPfMNcar9gotyHAFbzC8uNIB0esoVWxD6fEzHyokwvOJ95PZdhXuGL9xk
         DZdIWwY8W1Sq42Ri3pZ1+qYntvYAK6U7qdU0hMxZDMheBAk1XqBTBkJq+u4nSk7oRPip
         bfz2MjSxMfyPwDR4HnZ+qJdxme0KjXpU6MmN9JqXOk4Q7HvyI8G86tXa35T+s2eNs3fP
         2/Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWbvuELZ1G4EXXEZ2bkRnK819CHAvhKdHPcRyQKsIeiIVZR3XKeg0TJB1d9EWd/M8Dd0FgprV+kpcPmPCtEvUKc@lists.infradead.org
X-Gm-Message-State: AOJu0YyOMAe9XvMWIn28X+FiH/mzfyZ/QasC3Ne2WjnyfnjnUqXKShsl
	5/71jKUFT398BpPGEiu36BHVAu9/qewN0Ewhmsj/dCo2o7d103VyP/XlNs8Coif357M=
X-Gm-Gg: ASbGncsYMjYvVbgcxYNL3d9xx4EYe9Wn3uWwgITmmGZ2l9B0brDzUkuqgZGsU0rtimT
	drev7/GwMaqWXVBgfCf3TATVibhSrBFC+Wem5Z9pYdbsA+VMiNx907oujryzPJvhsdiRSzr0+r9
	jNDw0wu1ZsYjjrwoBaGzJvPkM8nvfLbRVWj4wikaeWxC64FI06aUyQxayMBf7EW84zXFerXcccD
	a1TLX+ZuWNXoQ6drkJ7uBvan3glRLfA8WZFGLwIkix+MNLcStmUu9eK/ToJMbunu86xc8mZ8WAu
	ao0E+C+Z0c4jDTp2cKUMNzm74KfUrMPzemTECDzHZXX9mgFFA3f2we/JqthbZs5GuL7l07//Kk5
	Q7ivEichdy7N4C9GoUljpb3VWYzGcDhPv8m8TSV/VsMFAlYZ+JfGVX3Kemr8E1WIXDUOk+n5PkG
	PKPPgiW4Nfom7Kl3UeBAEND5qoQa1/MqA=
X-Google-Smtp-Source: AGHT+IGetap4T/Eh1Z+oljdXnfqlancpgAhNO6qspGOxItJqX1hECPXKuLsbg0/AZayCnBvDbJQ07A==
X-Received: by 2002:a05:6000:4a09:b0:427:62b:7f3 with SMTP id ffacd0b85a97d-427062b07f9mr13782919f8f.33.1761049785129;
        Tue, 21 Oct 2025 05:29:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c34sm20057043f8f.17.2025.10.21.05.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 05:29:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250927125006.824293-1-christianshewitt@gmail.com>
References: <20250927125006.824293-1-christianshewitt@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add support for Tanix
 TX9 Pro
Message-Id: <176104978445.3075289.8934335794181531302.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 14:29:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_052947_134971_E151736E 
X-CRM114-Status: GOOD (  11.24  )
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

On Sat, 27 Sep 2025 12:50:05 +0000, Christian Hewitt wrote:
> The Oranth Tanix TX9 Pro is an Android STB using the Amlogic S912 chip
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/arm64-dt)

[1/2] dt-bindings: arm: amlogic: add support for Tanix TX9 Pro
      https://git.kernel.org/amlogic/c/beaea75ddc2a483e7b2b08a040d418f323510316
[2/2] arm64: dts: meson: add initial device-tree for Tanix TX9 Pro
      https://git.kernel.org/amlogic/c/afd1e16c6d3f53810ea29b5269dfcfc233e9b6b9

These changes has been applied on the intermediate git tree [1].

The v6.19/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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



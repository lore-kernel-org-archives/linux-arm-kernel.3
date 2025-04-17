Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAEDC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5LcbxHIEsi6NfNXL48aB+b5/EUn547ceJU8rD/SnfA=; b=hORiEZ5NXjYXYcbp9UJ3JUsitX
	KRu5OS0ox4zNsgkysRXX8YD2mg3vlTLIO/stUVjw/YLmpM9A35V+TRmh2wIlVQoLKREe9Qdyp6cb4
	l5YnNYb90585EpIqc7WUfLXhSRBGBP1RzlI6PAr26Bq296ZFhxEqrGcQpsfGobM8mG8TkSRPzRT+l
	u0PkuhJCi7EOval4JuvN6QYjSjN8iU46HmJxVB9CyyxIEAl6vFPGzArAdX7S57zVgPmRdvKdztEK5
	akbRrsRRV9NHRy2giRYA0uVFbBPvqoN5m2NT2oqIjhNIYDM3K5uzxu0MjFzrbabBxfqdaRU6XJyQx
	hm0DqvMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Qdg-0000000DOes-40Bv;
	Thu, 17 Apr 2025 14:54:52 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QCv-0000000DJBv-1vjB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:27:14 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7054f0e933cso7195827b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 07:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744900031; x=1745504831; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H5LcbxHIEsi6NfNXL48aB+b5/EUn547ceJU8rD/SnfA=;
        b=W9q82UuKDwdnyX6y5xRWx/aBjJKQV049zhx6QJs8PNvZ2YdbXgzhLPgVSyBszhf5WU
         HqAQRP2ndk47Ki/lugE511buEVFQCOfKNtnG6f7Z1ODvr7Jh/XOaORKkFG7RGFS2WGpA
         S/OWK8DUWhxbJRDih13jbzfWIRfhyM36ydLkJL8QD7qOZwq+fzZtn/P3BOVvttIzNVvK
         c1+XBKEp+B+oLCGcP42akCJBqOEY6dPuTgtoepvQFDDBZHSY+jYngdDDiKQBeyg165Hx
         rgZJpCmU54Y5cbwSn/k6HX7kzMLoRil3Hp3zHhVVqWZLAWaNdFbqYXt/84Yy+IUeXTZb
         GQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744900031; x=1745504831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5LcbxHIEsi6NfNXL48aB+b5/EUn547ceJU8rD/SnfA=;
        b=NKWmuMPDEk8CMLOHfomILB7NbHN2JkHXv8DEm8e+D0HamHbsFj7/EgpCuaFEKpDsiY
         KoJ04e/BgoAoxBz9BEZDGPAdfgWvhMtc7PQMmHA81f2WBiXKDkzQ90oQ6oJmEEEwjPtT
         9iezATwUgmJGPFAzLYYPZfBKTAMEHLoFDTxgXmCBPYpgFU4hhB/rJ3L7u3ssP3yNlhjs
         GG68gw2/dHvaQOSu4m09y1VtbD1g4L5fZ9sxympPrQRoozM18nksYtqBhsl/iso/z8id
         LHoXOKP5YY1wpetz6FmZVjF91uR6hX3Xx7FPnF9bjRXDS7SbV7r7IzoXRvNzmtwLX9t+
         7baQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlpdfu42MLlgpER6AFB3KCZlHTN4xVhfGs5sC5h/Dos5adPQRje1lBqMPnNCikPNM1eLgvV9dEG6MGTRJWXC5b@lists.infradead.org
X-Gm-Message-State: AOJu0YwwyHhrAAxqn5Y1w5Lr8ko3hfeBxWIm4JCRqxAefxSjiWN5oED4
	lXkYMo8wfGmEskqFGo1WG+GPmvLZzscWZyV5UxEpe2W+SZ/gRyMXdbLwk77c+09ZKxW4NML21jQ
	n15YNqIOUbJSs8EruqcblNElDailNIynP
X-Gm-Gg: ASbGncudYQC7cwkapS3bKV8cbaZaVxKQwX3yIX8B0RTBwcJyn1bRe4ZBXBijCzMVfWB
	w3knnMkkzIranv+6G8OIcJbwgdvxW8Zp7FcwGB1JckS6NPm8tXogFVnyebg5UtkVh9NOzJBFJMI
	37JNMqwdK0F5diBsTz3k15KsI=
X-Google-Smtp-Source: AGHT+IFlsRdoOPNKP+IgFk3s9dutZbcvjVOYZpKbxlSBuHkLsa+WbDm4tMUPjfUhVNf9zruI9fG719C6Puhpz/icXwI=
X-Received: by 2002:a05:690c:6b83:b0:6fb:91a9:94d9 with SMTP id
 00721157ae682-706b3255c50mr92412037b3.2.1744900031538; Thu, 17 Apr 2025
 07:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com> <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>
In-Reply-To: <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 17 Apr 2025 16:27:00 +0200
X-Gm-Features: ATxdqUG-QdtnFm03q8e1kJSl7Bv2F6tlWh8pqcBflMsEFPTlm2gMwGAFKqTZq5A
Message-ID: <CAMT+MTQ6gtQaMpH=5ATtJ_A7X6EjT2ra2UAe_1XiDAk1YGP2Zw@mail.gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add spmi-nvmem driver
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072713_493277_89E50000 
X-CRM114-Status: UNSURE (   8.22  )
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

On Thu, 17 Apr 2025 at 15:34, Srinivas Kandagatla <srini@kernel.org> wrote:
> should it be:
>
> depends on ARCH_APPLE || COMPILE_TEST

No, this is not a driver for an apple-specific hw, but a generic thing
for re-exporting
a set of spmi registers as nvmem cells.


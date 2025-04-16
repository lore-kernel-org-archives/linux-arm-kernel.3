Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1D6C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 07:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WPXE5cu+KxNpShEllczcd7X5h1MUBPS2Pl6xYsNrzA=; b=De2Cvwc58YrjftTJDkNLR3gRl/
	3haEPtqxHHibkkOk/FewWneS12I04Ca7GdS0UjYe3ydutYbxyVE5PAjGDY6pjRxGo3g64dLHFGGI8
	5Nlyk2Z53c81CyMb02FWFtBm8hyz/XRKpJzeIWqFtp0rO4gYBOMMhKYyuR/JsIB0ASAQ6mrwYDYca
	QcOJQpXeC0mD03s9hWrlLF/ZO96L5OvhG8x68SLOdaDs8HOaScz3x0yJNAxXuSbluVw1RJsHPPPzu
	Y44WEcsLhON7nfB7F2gB2yVFxRlbhp/LhcIToavSbNvguO9SZGLH1SySE4PUxNsmBGAaF6QZ4cSkm
	1/GWHumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xRD-00000008fhC-1xv0;
	Wed, 16 Apr 2025 07:44:03 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xNQ-00000008evp-3dLW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 07:40:09 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-70576d2faa1so28115617b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 00:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744789206; x=1745394006; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0WPXE5cu+KxNpShEllczcd7X5h1MUBPS2Pl6xYsNrzA=;
        b=btFE9nTVdaENc7o8hbiuD6QaMtzbIDAsHyb59rd2A517+5/VKX+gWAQw/Q6F6NlgOE
         5o5ULDy1pPHVVDhQWxk8JLDWSyBiXvRDCOrat19lYC8e/4N6IAWrlxlgFlw5R9uzgvjT
         +wmvh7oQrmQp8DlWcqNybnUbeXbjDq+GBxvFzu6h7tQsIs8IshxsaRWTOP6NrTUjLTuB
         s/z+MqphraMrtOQSs0ueS7RWgzVdXD21oMgGVvYSK6nmdl3n1BxK56dRMtvXRM7dCrIg
         JOahkGY3kN293+aBiL1UbwIREPZzpL0fKpqtrEHfI7Ofj6OOygK5oFXDgyG3pC4Q7iiq
         5dNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789206; x=1745394006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WPXE5cu+KxNpShEllczcd7X5h1MUBPS2Pl6xYsNrzA=;
        b=w0BN2H6zOVmESJ+xtoHmfFpfr8B70gNxhlmSqvimi7VjyrztXl7Qz+n2EcAnjz/Nyz
         9qwvBJ75Hjq7yvmBzcpov2YMvpLeA22jF0Q23oU5vC+YYWCBYsnUH79HkEsiFd5HaMQk
         ncEGNWtUfp6iVNPxiGsj/wnQlIKyUQxDLz5CMr3k3MYGc0KfQb/qNieUF/VMWyG7Xmsb
         FEwPiOb9lHWi7+8Cql1DZETkkAwY6jakZc78PurHEk/v+34tq2+dEVSAbB+O/UxejK4B
         FNvsAjXY7dNFJllfT6L5KTEeou9ttTv9rYcVPv1xKrEGdX7Q9sGR2paS1xr1iY4dHUOH
         RfOA==
X-Forwarded-Encrypted: i=1; AJvYcCVUqXXHAGshyd8K9bwtUnDdPu1XLPB9c/N/b4l5Xg8TEf3w/wwEOyL7iNqte7JOV86NZA+rFfpeLZz/+PBONcVP@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjawoguk0ywIEf6iCPq6oDqAAYPlOf7fWQkhQHI3illzPryL/I
	4iedNwzELxcmBeDe73WCwKMvpipbz7mppRjASDL45lIdHuQmeSTIb7IKbr/qHQAwjHOfbOTohlE
	8ZNoUqRzM+6ojp7e9iNPN8XsuvhM=
X-Gm-Gg: ASbGnctceLNuVY4QwlS6XiY3n49GdkFaYahFXclHZcEkf8g0NR/6zVlWvKRBUyZhRon
	UJk5dGtEebTk4sfg8MzAHizgMJz81RNDq+KuPWTAnoT4EZ4DJ1cxd4AqsQzg4mI41UVb+ioqZ+v
	QmPHcv9ipMpIlqPLZc2ivnw8+SEXS9ow+VsQ==
X-Google-Smtp-Source: AGHT+IHxbekuxWHZw8zM+wh6DzTFP8yHpFvuhbdM9QR05wWnGQlGmcOgzlNDdA0KhXBzuIW+VyQTVJg2vQPk1/AsoLU=
X-Received: by 2002:a05:690c:64c6:b0:6fb:8461:e828 with SMTP id
 00721157ae682-706b33627f1mr10607287b3.30.1744789206293; Wed, 16 Apr 2025
 00:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-1-22067be253cf@gmail.com> <63957942-173e-4c28-932e-a8ba7c60ee83@gmail.com>
In-Reply-To: <63957942-173e-4c28-932e-a8ba7c60ee83@gmail.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 16 Apr 2025 09:39:54 +0200
X-Gm-Features: ATxdqUGe8fo0djVdgl0BDmuxVBDLtZEU6DP9B-jNfmxJRRmqMcv0gVTVOL0H8A4
Message-ID: <CAMT+MTSqdzg9pBCW0qB1KMK4t9w0-fM=vRowO0kWVNqK9GtBRQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_004008_902974_0B07095D 
X-CRM114-Status: UNSURE (   8.97  )
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

On Wed, 16 Apr 2025 at 02:18, Nick Chan <towinchenmi@gmail.com> wrote:
> Also, the PMIC definitely has more (mostly independent) functions than just non-volatile
> memory, so I am not sure if it is really appropriate to model it as only a nvmem device.

It is good enough for the PMICs that i am adding, there are no plans
to expose any
other features to the os.


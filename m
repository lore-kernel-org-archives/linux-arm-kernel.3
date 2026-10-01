Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBE5CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 19:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JH8rWq/AytgPhFoS61LuGcNOLtYiANYYgdfeoHCVlD4=; b=cC6YOtGmLf9Ft5QcA32k/q8vUn
	nQA9O3U/6d+BpXxo/qMTm+4WtESKqic39W1mR8dikRiRGjxXxf0oOGjn0vKa4sQpQPfpFH5RM4XzC
	MXAk2cdV+w+6fuPRCkwGqzZqF1HCKsN4uJOEkQ1dmMLY5LGykzJShmGdHE1u75OBFxu1juy4xKfRV
	8bbqEacODs6pXlhoa89IpIEzOAeU0YH4T3pVKaxXpS0WCrpl+d+w0iIQ2NkUTUzO0vAnNUxI/ipKx
	vfmfbggJU4OPrsSEv4iWfMN8QiibT0JSmHQqfnpa+BXvQFDUemijSv1wkeokQOWVKAjU+IEJT3Ode
	hRPkQZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCM4T-0000000A3VF-1LAH;
	Thu, 01 Oct 2026 19:03:57 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCM4Q-0000000A3UV-2u6t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 19:03:56 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48b09f6bbe8so682280f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 12:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790881432; x=1791486232; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JH8rWq/AytgPhFoS61LuGcNOLtYiANYYgdfeoHCVlD4=;
        b=mDlLB6lovEVAs5YNYWZWbL1R1nOheYhOLqKOHUFcIhy1Gmx8LHhPUXsfF7J5ZcvHop
         hgJVjI4y7236G7ZgxrEgDcglR8F59qtBDElnDIPLp83NGcWvFplmhKUGyLf8XsbHCoEJ
         hO3iENlNjoU/s24t3xvOpsrt+dA7cU0B0o+HYkFCGpUkioeLNFQ4DS5ycwbWNttU9cHd
         5GwfbJYf1EMYkZIeT2y5MA+lfC0UzBqi8gEJ3PPHhhoVdfSyXatvonJEgOxkgBF9XuYk
         zM6umTqktgiaJ5GvJ9nl1sRnLyULmiF72HPmKfYWbjy4nfQyaB0VA+EGiBmbTBQzoMXu
         Zqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790881432; x=1791486232;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JH8rWq/AytgPhFoS61LuGcNOLtYiANYYgdfeoHCVlD4=;
        b=l21coQ+eM2aalfHzCb6ZK8R5koQ/CL00OJMfWL6mudK/xe/fdoW7Wd3o6XVoF1P95e
         imYKCqoAEu1Xiz4bDFFoP3I5GNuEuFWvGviXWHzEvvkqD8mWiGFCttgjnwmxNeLHXnB/
         HN2kiicuG/hn/a3LdrukNICWGBBX+28P1JU5BkafzDCt4syK7ichVMxi13nPNnn9Iw5D
         uvURthbJjAryEqUobc666f2XqN/d37qNgWvhbdn7dYxv3Vv4YRyx9RNi7yZeCKEB3BdA
         kwRCrr8Jjw91dsE+95Hb8l8rgnShWRCTAgANmXR5oJNqFc0NzKDR3j7DS+n6BM1UWJuz
         2pGA==
X-Forwarded-Encrypted: i=1; AKwUvBzBs0RPuWvLv/IspGhMZBStjr7gWxiHzHTojCcQv03AK6Rolz5V7wIUI+7OuPEX04jKMVOQyR7F64VjjrvPVnU7@lists.infradead.org
X-Gm-Message-State: AFq9FYL/p9A321ehJFiX3RavAZfwSDUcIB9xHbhcn/QTdyiuq7WbHTHe
	puwPdFolCbgta8VM8tyF9WeGTKDy2G7dX32tt+tmA7NVotvAhPrC+jzpuKfId0o+biVxnYmP
X-Gm-Gg: AYBFou2w8g9d3weJM6Kk3tWBqEfD3vYx8VCzUnUh8wnpiiOdxccTiFbG2jBr3JZiFlz
	5mPygmpWta8WLntuwRz/Eq1snTSCljjSd6laqEXEIVwGiYQHBrQFxbaPW6vCX1lbxFH3YaWJmtS
	17Ki2/UX+ODDtsPreM0FcUlgGMK+qC5J36TBcCw4f75cpDBTbTpZT/8+3nFkuc/vMG0zTSNRlrv
	qDmIXAmkWQHYkN2HiXepTr7cGv/JdGinT00kbN9QVWmqYjbSrk21fepxc3PDniKg3bDvoPcXiaV
	1WakP0ZHB3aktV1QAi0EauntNLMBVgH57Etu6kNVvLOGhUbUsZEh0R5jslIO6dT6RzlK4q+xi2C
	lGtMPJsaZFuGXLurIKBXvzGUca9dOWD6aXI7RWE3dMV4y3RRnyA2lCKUonq0L9nZh+4+jOx+gmV
	+nRQ9t0jvI2sOJmc9StY47ZG54Q+XnNtPILcMvuPsMsFTYCHh+YBi+LbR3ZIlp48QgwQW3GuglH
	t7nP0liLVMkUu9tuUFAIduFXImKwvdRPA==
X-Received: by 2002:a05:6000:491b:b0:487:da0:df5a with SMTP id ffacd0b85a97d-48b12729938mr853133f8f.42.1790881432191;
        Thu, 01 Oct 2026 12:03:52 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.23.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fada5sm222539f8f.24.2026.10.01.12.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:03:51 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 06/10] dt-bindings: serial: Add Cortina Systems CS7542 UART
In-Reply-To: <20261001-depose-jawed-f58674109fe7@spud>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-6-4617c4463529@gmail.com>
 <20261001-depose-jawed-f58674109fe7@spud>
Date: Thu, 01 Oct 2026 22:03:49 +0300
Message-ID: <179088142900.827715.5924606072568297915@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_120354_737686_BD224B12 
X-CRM114-Status: GOOD (  11.93  )
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

On Thu, Oct 01, 2026 at 07:48:03PM +0100, Conor Dooley wrote:
> > +description:
> > +  The UART found in the Cortina Systems CS75xx (Goldengate G2) SoCs. It has
>
> Different SoCs need specific compatibles.
> They can fall back to the cs7542.

Right, the text reads as if the one compatible covered the whole
family. The binding only describes the CS7542, which is the only part
I can test, so in v2 the description says just that, and that the
other CS75xx parts and the Cortina Access ones (the same block, see
the discussion on patch 7) are to be added with their own compatible
and "cortina,cs7542-uart" as the fallback. The compatible stays a
single const until one of them is added.

Thanks,
Fil



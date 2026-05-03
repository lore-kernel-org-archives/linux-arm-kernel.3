Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B20ACD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 02:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2F3DN6wiiB7iU2Xt5hwtqlQ5YfweZqx1JbBrqimlAs8=; b=iKIba8KaQJGTUeTnr//QeD/bC4
	y2q0kT1XMEHBt2kUXmKLiZ426wUu+Z0jdwVIR5iHRKzPfHB64eZkrlMmCUB0xhnThd/SPp9LYLDUv
	jx+kJtHr5iOnISfgPGeHTM5coWvsodm5oovT2HmLn1ioSrsf27It1OwHrSqL3rns+ARfIiLIGjUQl
	QF3UucC5JfI3kzViWbwBpFrib8UonAi3yvpaokLonJVP/w2Sv7FskSth1S+Y+p6M4nh9iJ2AZBro/
	yXjE/xiBHLG+R9E8TCiIvDEtYbcSFxURc4sRIC/iUrZR7pJ7imz+Y1PzbQ/Q9D7GqBH4j78FVer98
	kD5vdRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJMEr-0000000A869-3bN5;
	Sun, 03 May 2026 02:07:21 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJMEp-0000000A854-3tmc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 02:07:21 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8eab809593cso321023185a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 May 2026 19:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777774039; x=1778378839; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2F3DN6wiiB7iU2Xt5hwtqlQ5YfweZqx1JbBrqimlAs8=;
        b=tM6Dm1ezaN6QJZs94DPRHWEhVxZh6EXzYRWB0zmtGthOHVY6vFnfmyKRIxZWY5aobl
         KyPeMomtRVcori+ICYbD5571jDEjr8jO6YsnnQymBHoEqSk90+iPzIgLDVgkNvJ0v3t0
         3XkD6dBfvsasBpMuNtYkAhBPzikkHTgADOhwKsP7EZd2g8NZfa7Kadzux212T+kWvLOv
         bnXPW4g4YOmKabq/VHVPutsxZMhcCvHulHQshF8+9tD88HoggM0tmWrG/BL48ccnxzHs
         fQ6v9RmD+unVg1+PnsxxxrLN7/MF7XYY06Jygw8ifoTXWyhzZEpvaNY5fA631jm494Lv
         jTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777774039; x=1778378839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2F3DN6wiiB7iU2Xt5hwtqlQ5YfweZqx1JbBrqimlAs8=;
        b=R9ALqA71atDOauLm3eomrrqAt2kqx22moh375aGIl/+G4t1pT86KCqZzmBTU94DYl3
         rbjWgcXWNuXgZzCsbmy2pidgncKTgdHOZTgci4hJns+3/JoVDI0/ILfrYot9FAjBuFJ9
         06SgCVKYA//hcCSlhVBiXzb+k91UsQRr32ghXW74Q7iK6tmRoM1dFaU8isZzPqNqh4cp
         aIlWcsF9ROUz/zhcRqc2HiHT9WsZp6WZEB2lOrBmhRblcTSkHQ9EQX9tflOt8dWRdFWc
         m0545tXEgeOyOyj5rT0LwVk5yHJcaRj3dk1lUTXvFBr1fuhum+FttqRrO/B2wfAcpron
         LS2w==
X-Forwarded-Encrypted: i=1; AFNElJ/zPKc8sjvJaJRlwsj3F+090u7go/+SFHj8X7fl63uqEgOXPlkyNpVvVAG9yofcgzvsDJs+69FTT5teSLOMLkmU@lists.infradead.org
X-Gm-Message-State: AOJu0YyQIfQLu9H0bAFxAb/Alel9waAQnBqkUJoSNq9zX2KVYhdlHnDG
	ztXapTdjHQ5bw4wioUlbDWd+Js5lxlI8+W2rP0gbggWBOrTQ+fvbUABym9GnRIhQ9L0=
X-Gm-Gg: AeBDieuwP30AmKmVDJxlrZikC2iNNp1Xb7EiiHDXapvJm57rf4zyUpyRcMGEGdT/z11
	P9+uSwClUivNRNoDYAbtxD619Z61w5LBx7ZIpCKdZwfmcfqXJeTH3NkCg6aiHMcrG0fyvLUFVDm
	QEblunDUkDjZADs/22fxs9a8/v6nhnSsrL5+u56PeFJ8pePiBPdDjyyDgqrCNfV+uT5NhbsJWgL
	JRjqED69rbpTJMdx2J62u+raEyYxdG6jZrezSW/WjRkBn32kD9l7KMaheNggyHy11qkADosK9qL
	NxeDco52c2qcCpRXFMNmDpkVxWD9hSFqiPGzm2yURgFACJonZMFoZIeEkLg/xWhdnFLT+xAQtgK
	xWbLFCed2rpLDDaNJppuYkUYpe+cJPt9iLhI3XE3eAl+EKVGqtjeDIK43txAwiKz1ieXiLk24GW
	UsG3nJN/eoelE+X9iQ4zRbc5ehGqUTxNxv9/grOv0alR5TSMna0WvVaB807waRo1Ukq8PZiELTH
	qjHA+cTFhb/
X-Received: by 2002:a05:620a:6914:b0:8ee:cbf0:8311 with SMTP id af79cd13be357-8fd18337fcamr755624485a.54.1777774038660;
        Sat, 02 May 2026 19:07:18 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc29889603sm636397485a.11.2026.05.02.19.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 19:07:18 -0700 (PDT)
Message-ID: <e39b710e-c742-4485-8798-7e27bf15e0ac@riscstar.com>
Date: Sat, 2 May 2026 21:07:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 00/12] net: enable TC956x support
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260502094712.69b29dc8@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260502094712.69b29dc8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_190719_985048_3ADB40F3 
X-CRM114-Status: UNSURE (   8.66  )
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

On 5/2/26 11:47 AM, Jakub Kicinski wrote:
> On Fri,  1 May 2026 10:54:08 -0500 Alex Elder wrote:
>>   create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>>   create mode 100644 drivers/gpio/gpio-tc956x.c
>>   create mode 100644 drivers/misc/tc956x_pci.c
>>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>>   create mode 100644 drivers/net/pcs/pcs-xpcs-regmap.c
>>   create mode 100644 include/linux/pcs/pcs-xpcs-regmap.h
>>   create mode 100644 include/soc/toshiba/tc956x-dwmac.h
> 
> Please add an entry to MAITNAINERS for tx956x stuff?

OK, I'll do that for the next version of the series.  Thanks.

					-Alex


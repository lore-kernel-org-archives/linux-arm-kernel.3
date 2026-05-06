Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EBCCD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 18:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVXRMaORBAm1p+hmPERIzD3vaX/XPR3tJcXrI0tApsg=; b=DKsWg+TnHoy0zuP3jGsiacjb4O
	4cUuPYp5RMHR8nkwVtgY2PWXrq+++M1p1xjweRClnxPsyUOMY5USFxqtxsQqGtpVSJ2k2rxplEGac
	nD9Al5VG7iowUjrCItDZh0n1+etYMiPwcwd3jQwG8ZYiDD28Ey92WfeLNZhIPX8ko7j9yWQE6Fc73
	meIFd9RO8MrveVmqPbCImAhavfdkgyC+516j9AkH2F8ULZCsBVpYCihUmL2lzbmMviBYj2Ke90CBi
	qpbj1cJ8X113+1DPbnplLFT78nqlMSrRT0q/6pObsppY5q+AEK/Tt7VBH6+P0BGRhp4L6E1AhgtIB
	lRgWd8sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKhL6-00000001oJ5-09px;
	Wed, 06 May 2026 18:51:20 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKhL4-00000001oIb-2JA8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 18:51:18 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8ef45a6d9dfso3878585a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 11:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778093477; x=1778698277; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVXRMaORBAm1p+hmPERIzD3vaX/XPR3tJcXrI0tApsg=;
        b=wedYCcc0N8L4Z29/3l6d/pbfFh32+zNdjXBIlLGuBlMDOCThnEwph99T2F9R42fTme
         jZ6v4mWQn7H4wW+tMk/d2UzJn1XeseSJZtdR9tUGJk9km2jSI4VoSVwY10ZdUCbjNe+J
         d74NHD9M03h4aVB6Pj/PGzDx4WndWKDHBdpdXNseWkIjfwW5sCb4PE9/W8CS1XGikkoV
         Vx536RrddJ+IkE9JGE3Cr90hHwqRX2hS0RwFb7Dr3b/rzrkA3vRAscdO2XlrVn3A/Ibh
         Y6x9VuGdRwpR/m2FWk9SgRRUBH8Vau5xsTRrAMwW61tLAFz9V1Xh9ZE9H6jnwdd1aAC9
         HJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778093477; x=1778698277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVXRMaORBAm1p+hmPERIzD3vaX/XPR3tJcXrI0tApsg=;
        b=pP0soUYiu0fP7H5O2ch6YrqGJvLE8KpJdUpnBXb433mZaShZYweoctMqg3E+FgQF5q
         gvzEsH5riBiUHjSX/QKmKIh4MAS7iUJV+WICGaVtV+7HB0SoxFC4x4HPWaiMGhdEuKFM
         HMZiTo6Dl4g7W8PKkhefWcS/cVHvQoUjfanjsCjaPXEWKA8/J2Jysqd2N6qbDLAadcID
         fMD9/Mq88aIyYOw7emPLUlqHur1ZlW3MpfznJ91k0D9K4+UgPruziu0jd7Vqe3VqCeN2
         RZntLK3uu+DqHZ+RAnexSSIbsc690B21D2O58Y+Qmbhl3svFAx54yfM9eB1XInBDJjEb
         28ow==
X-Forwarded-Encrypted: i=1; AFNElJ9EL2PhhjlzZGYAtRPZ3xuS3RmAtX5pY9KhQNTSi4i4XeH6ofvRY9kfQ87YkYm/9Yqxgzehzq0njH49vPgGJUgW@lists.infradead.org
X-Gm-Message-State: AOJu0YzBzCnZyS4/bh8F21Xxn7mvAUaLvZdj/VEU5XRUHwzciOMG3JST
	RQuT+UiwAgr9D96IaBfbi80BhdPtuwH6Dz52Op9sOSOUm4Sbf2taXdDPbFjCevcMQXI=
X-Gm-Gg: AeBDiev5N0idVivAzoxTA56SoCDQWtfsLQzRHuBQVUeHi8Bo1B97Esc9RhL6SThJ0xe
	2iBOJxzlJDz1FyWSQJ2VCF90uRV+YF3kgRjJDFON/D0KNHhWKfowkVhtfBk/I8yuO3Q03unyoin
	exZgWujAy6k2M/8kl75yGN0I7fynAqBW1Q5jKTOKv3dxuFBtD4IEvKlrr4n6OMZZpcTiacZEEzg
	wmhvJR4qzz7mj9VUeDgFFGuCplcFpJ3hM/C3vhhWUTXSLNucRNtBKbYutu1wI/NdX8rgvGnhqWE
	pR7CPYO4theMab1exQb2CT4bkWTBbEIB8HwrCnxCpLkaOBI7dcTgQt6m0JvOvmRpx2ExAjZscva
	CQCc4BLFpQx1G/nRTvMjEdbv2eL7WmDqdcBcAwgQt9w4reiVaAP77ONbP0Yle2i++CTtSTYdQu7
	j3zCHGXX8+0uR9Bg9YAphJPD1kn5QX1zB8fePAEwqO1ZP76s/TdLCfvlsaNjg9XjVmiQ4aF05e0
	A==
X-Received: by 2002:a05:620a:1a13:b0:8cf:d804:456a with SMTP id af79cd13be357-904d4c54265mr713100885a.20.1778093476942;
        Wed, 06 May 2026 11:51:16 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc293837b5sm1889639085a.10.2026.05.06.11.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 11:51:16 -0700 (PDT)
Message-ID: <a52659e8-0382-4eb2-ab2f-5563bbb73fcc@riscstar.com>
Date: Wed, 6 May 2026 13:51:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Julian Braha <julianbraha@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <1fe6bcb7-b5c0-454f-ad54-5014006edab5@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <1fe6bcb7-b5c0-454f-ad54-5014006edab5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_115118_861206_423CE31E 
X-CRM114-Status: GOOD (  15.47  )
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

On 5/2/26 10:42 PM, Julian Braha wrote:
> On 5/1/26 16:54, Alex Elder wrote:
>> +config GPIO_TC956X
>> +	tristate "Toshiba TC956X GPIO support"
>> +	depends on TOSHIBA_TC956X_PCI
>> +	default m if TOSHIBA_TC956X_PCI
> 
> Hi Alex,
> 
> In your Kconfig changes, this condition 'if TOSHIBA_TC956X_PCI' is dead
> code. Since you have the dependency on TOSHIBA_TC956X_PCI, you can just
> make the 'default m' unconditional - assuming this is what you intended.

I'm not sure I'd call it "dead" but you're right, it's not
necessary because it already depends on that symbol.

> Perhaps you would prefer to use 'default TOSHIBA_TC956X_PCI', which
> would have GPIO_TC956X default to 'm' or 'y' when TOSHIBA_TC956X_PCI is
> 'm' or 'y', respectively.

Yeah that might be better.  I'd like to eventually include
COMPILE_TEST as well, and that might need the "if" on the
default.  I'll find out whenever I test that.

This GPIO feature should still be a module even if
TOSHIBA_TC956X_PCI is y, because it's not always
necessary to enable the GPIO driver (depending on
how devicetree defines the PHY resets).

So:  In drivers/gpio/Kconfig it will be "default m", and
for drivers/net/ethernet/stmicro/stmmac/Kconfig it will be
default TOSHIBA_TC956X_PCI (at least for now).

Thanks a lot for the suggestion.

					-Alex

> - Julian Braha



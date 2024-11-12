Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02EAD32D78
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LRFE7o764/lq/KwAISV7bJ6SwNHRnb2w6OTp6CEmqg=; b=pB6+u8+w7duol96Pykrs9LP+SF
	VtNtT2xk2dQ5NqMjoWfn2inJ37pGuii5uyW8ZyTHnVmMy1Fo45OtAczzEy5DlOKx15B5M4+BfaOly
	TzTNwYSSsWYxJDTOndoiN4PvCM690ZWDmijRtOREgKpwLMPa1sFN7bbUsK5Rt3XWFSMul2GmlpFl+
	sKpU1LEk16NECQfvdb7vE4QDHKpCRr5q75IyV7Qd1U/p85r1UZc+YM3NGGmQ3CUQpAU+FNyfHlQpx
	HqFAJdwkfFfqmRdm294Y0EOSygbYuwghlQHVSkbNkTszoU6TT1WhJfp7F7XqKRbVZBs+pOcYzGr0c
	cdhPEvHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnFr-00000002pbf-1Klc;
	Tue, 12 Nov 2024 09:32:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnCI-00000002ooU-3Fob
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 09:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731403708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3LRFE7o764/lq/KwAISV7bJ6SwNHRnb2w6OTp6CEmqg=;
	b=E9pdjrZEa+lXfgulWNVr3UF/GEzV2QSqoh5dYx8naO7LTSlZfRRsBLNO6wIzev101uPcTR
	VtF7Q2NEjuE+9pULzhiBou6xcV2tzVGDfcFeQNcPw8gmupKYnkwY4orePaHprz8K9Pm9aN
	ecdorWXqqRzapWWgXkC8HPNNBndgXqk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-aydaIEt1PbG4k3FEPTVkDg-1; Tue, 12 Nov 2024 04:28:27 -0500
X-MC-Unique: aydaIEt1PbG4k3FEPTVkDg-1
X-Mimecast-MFC-AGG-ID: aydaIEt1PbG4k3FEPTVkDg
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-431518ae047so33662995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 01:28:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731403706; x=1732008506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LRFE7o764/lq/KwAISV7bJ6SwNHRnb2w6OTp6CEmqg=;
        b=sjiOXTKq7qoU+M7ptxCn3l74jba9Q+UdLfxH6g66wTRPCfRJIO0W7IIs4AWWH3496K
         w9Ec8DEcBN7gcSS1KfwR/zqzrGj01ugkOpUEPagdlrJDVQNyzgKFf2JZDo/glvu9QtOD
         mxeezQZ1G4XXiPaRTEmMxdvCbN6Q/FyURSHWEP/dnIGxGgG9uSOJbi8dY5qpnMGP6eNC
         4CB97mTwTdXv/pYt0IT8uOZ6kW8xVPg11af6s+EvsGAaq1ntj/w+gcw/BBCn51TuBzx9
         JngLIBoYQGakjxP/M6Z6b7OwsT20bkBNHrRaqxQhpQe1A9I8LpPEwkIBsmwSTr4GfEKZ
         TFSA==
X-Forwarded-Encrypted: i=1; AJvYcCUkbAlSyNUP6K/iqv4ra2fs6r7M4p502hdzdIy//LM0Juos7PmaBHrGgLZ7n5UjDv4+AGe99tdzZAKj5UYANJ/n@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8+S4YtxeWZUdyO6tZiDrCN5PhhRZeyDlmKkEE29vb7oWuRw4Y
	XrT19jKBbs6WFMh0I9yWZunOCjxRlaMhmSpXSFrU6ThkJ6q780E2h374PJECngeUlPnMm6mA3ly
	jZOkBSFrDxA03GpjObpuVTNp1hCedPQ0dPhnKhAGiqAoC2y1Mh2hBhLkqdI6uz9yR4dtzPQJU
X-Received: by 2002:a05:6000:18af:b0:37e:d6b9:a398 with SMTP id ffacd0b85a97d-381f0f58473mr15019435f8f.9.1731403705763;
        Tue, 12 Nov 2024 01:28:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeFow1WF3RCdO19wHgFR4siQkWFoCuOojrbHUtDMVrlBsQ3slzVULhivX2xSddNA9hsGCcXA==
X-Received: by 2002:a05:6000:18af:b0:37e:d6b9:a398 with SMTP id ffacd0b85a97d-381f0f58473mr15019417f8f.9.1731403705441;
        Tue, 12 Nov 2024 01:28:25 -0800 (PST)
Received: from [192.168.88.24] (146-241-44-112.dyn.eolo.it. [146.241.44.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05e5bddsm206187215e9.38.2024.11.12.01.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 01:28:25 -0800 (PST)
Message-ID: <1b335330-900e-4620-8aaf-a27424f44321@redhat.com>
Date: Tue, 12 Nov 2024 10:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 4/9] net: stmmac: Introduce dwmac1000
 ptp_clock_info and operations
To: Jakub Kicinski <kuba@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
 <20241106090331.56519-5-maxime.chevallier@bootlin.com>
 <20241111161205.25c53c62@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241111161205.25c53c62@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vK2I4NZxXJtAhhvWjeGHfYHq2IuHaRoFUuYOLXqjKVo_1731403706
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_012830_937924_4982DD77 
X-CRM114-Status: GOOD (  12.08  )
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

On 11/12/24 01:12, Jakub Kicinski wrote:
> On Wed,  6 Nov 2024 10:03:25 +0100 Maxime Chevallier wrote:
>> +		mutex_unlock(&priv->aux_ts_lock);
>> +
>> +		/* wait for auxts fifo clear to finish */
>> +		ret = readl_poll_timeout(ptpaddr + PTP_TCR, tcr_val,
>> +					 !(tcr_val & GMAC_PTP_TCR_ATSFC),
>> +					 10, 10000);
> 
> Is there a good reason to wait for the flush to complete outside of 
> the mutex? 

Indeed looking at other `ptpaddr` access use-case, it looks like the
mutex protects both read and write accesses.

@Maxime: is the above intentional? looks race-prone

Thanks,

Paolo



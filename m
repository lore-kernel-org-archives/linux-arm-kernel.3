Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16B9F54ADD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 23:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGb7XwT6dZksneWtItSppfi6d0SJR5kEWJ5U/fM6W/0=; b=UIy05otPic6Ua5MZakBRjstjrZ
	yGqmNbYcMam66YTPFTCTusNe5o7iEVMDJZS3+zbcgmAhpsz1g3LqUxS7URZEY/LzUDzV2PcRcJI0F
	4497g6qnJdgshunVVtkc90Wf/msVZfuy/GCMVQPgE1oMMAQt3SvIUPCZAMtTr2veqyzXJaLNqwaxJ
	smwLC8yc5CTsggNVlJSgQ3yz4d+FCzOwkr7+co4pKz1SiOMn6fLOxk1SDpVGNx3Wmkh636j0HcdZQ
	GzD/D9SWjf2tUUQ78on4EmSCr7F1DhZfsXN8uwAT1ybIhgf98/KAs7ozSHU17/bBXr4cLQ3NUJZuf
	Gybbe+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5BbS-00000002N5D-42x1;
	Tue, 24 Mar 2026 23:56:06 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5BbP-00000002N4O-3B5q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 23:56:05 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1271257ae53so2056030c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 16:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774396562; x=1775001362; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CGb7XwT6dZksneWtItSppfi6d0SJR5kEWJ5U/fM6W/0=;
        b=sYj0Q+KMfWq7gxgk+jYEE5TsVqbztCoVTPvBTp2myqvOcKSr3bq5aS0j5+0hVFzZVz
         aoQvw6vS5/p2uRQcfN3V7nSq6C6TkuXVol4CMk3hxBC88Luiu0DW13FwHMSKDkuMQWoe
         2Xn1lvUBjIkJnSw7BSLPkc21R8aFNHYWoNYvwhlpYO/8CnUqVTrlumAWjLOdjAcTCI44
         2FKuBJKCdH1foSSjIZAmY11bxolAWlVykhiOhPWbbAS7AkIWsS6EZRr9p3laPDptOlud
         iLllR31tXwuQalH/SGEH6YRZBrnonVvqwdotWvGrNOaH4i2F2RYf0KcU2J6pHWn+DFsn
         7MRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774396562; x=1775001362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGb7XwT6dZksneWtItSppfi6d0SJR5kEWJ5U/fM6W/0=;
        b=m1s9uBhDfRESI8BjZaKfdjPMlm/yomjn7MRNB+TVPhYPx5ZZrfSsgaXob776OfEQWF
         JMYk0It73NqkNHf17RVp7l4kpcfTGXJnZ+v08LwU5dc3sZLO0Up7fH4FR14quXG8UgTl
         jAKt4po+np/eBKv0m4bRpvp7T6lnubj/F3hwxqDev4Xrjmb9M0KEtF3jFz5KFA0kj6nN
         8yzx8yus/tT8EKNYUpJ8WOiEvkRgjcKyp1ANTzS4cXbpEdJS6R8bJIxKbRRpuOM9Gpfu
         jDeRC49OToWOl7pPzJiE9Mlyn4m1SjHqPYywUKKTVygN2puFn282YlfjBlpYcfBxOTA9
         KQCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWQP5qFiUOkE2UN/oQgy+8RjEMa+3TXyz/gDDz99irhThdL6TeliMcjqsRN6LC0o6p8ARa4chNVYcz/mIBSvJE@lists.infradead.org
X-Gm-Message-State: AOJu0YwLA6Jw3qxzt27N5/+yIikaS5sz6631ORepvQ1KT6g4coNNe6wH
	xPQbr+OMm7PyPNXV6WZ9kPZhDy89m8CS6ndEDTBwUTo0e0kXEfVViGQW
X-Gm-Gg: ATEYQzymMm2cVbHG4CkcciNcS1wuOG7gz83JXrGsXct6DerjdHuc/lit5SVR55qDc+D
	QUi2pKp6ZLdcwT/UMMqi3RoMzkNV1CjDrDqjRKm8gVBPDUXg6WFmNmaqMMHPd5cKZ1xQKKhxUb/
	Tvjuef3Jh5QlMeWzmfrNk3TdPcddQFZ0IHqpP8OQtHzH9V6JSLIviLPQihh3xf38UnXeXwjxFGr
	KMaXk5LRiP5reE2zZADvY5kOcVDgL3UiGDHN8Cq+Y+qJE4ZXZJmplBDV194K17Y48sM0eCEUlcF
	i+Hku+myiriQWHzPD47GaR0C+7zdDwwzZt3EHULjatdLX2GylAg2PQFbE2e++7Y5Z0xDSgLL4E1
	oMRsFYoPcot63y+kMOXgoHxesGOcEKUXnWcRkICO5rWaogznqfJDa8i9v//LXZUk18wrcden9WA
	+licw/bVr/g+is6O/MX5ycJHrTa/AP5jOe5ZH3yBLFJgcMn0OKGgml+ppv7SNUa0pSir2j3znQ
X-Received: by 2002:a05:7022:688e:b0:123:3488:899c with SMTP id a92af1059eb24-12a96eff7c7mr646452c88.40.1774396562027;
        Tue, 24 Mar 2026 16:56:02 -0700 (PDT)
Received: from [10.69.65.75] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a7330d1c5sm11716427c88.0.2026.03.24.16.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 16:56:01 -0700 (PDT)
Message-ID: <945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com>
Date: Tue, 24 Mar 2026 16:55:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme: Move nvme_setup_cmd before hot_pathing
To: hmi.jeon@samsung.com, "kbusch@kernel.org" <kbusch@kernel.org>,
 "axboe@kernel.dk" <axboe@kernel.dk>
Cc: "sven@kernel.org" <sven@kernel.org>, "j@jannau.net" <j@jannau.net>,
 "neal@gompa.dev" <neal@gompa.dev>, "hch@lst.de" <hch@lst.de>,
 "sagi@grimberg.me" <sagi@grimberg.me>,
 "justin.tee@broadcom.com" <justin.tee@broadcom.com>,
 "nareshgottumukkala83@gmail.com" <nareshgottumukkala83@gmail.com>,
 "paul.ely@broadcom.com" <paul.ely@broadcom.com>,
 "kch@nvidia.com" <kch@nvidia.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
 <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
Content-Language: en-US
From: Justin Tee <justintee8345@gmail.com>
In-Reply-To: <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_165603_797530_5870E92F 
X-CRM114-Status: GOOD (  10.63  )
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

Hi Minsik,

 > diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
 > index e1bb4707183c..8ea37102a836 100644
 > --- a/drivers/nvme/host/fc.c
 > +++ b/drivers/nvme/host/fc.c
 > @@ -2762,14 +2762,14 @@ nvme_fc_queue_rq(struct blk_mq_hw_ctx *hctx,
 >         u32 data_len;
 >         blk_status_t ret;
 >
 > -       if (ctrl->rport->remoteport.port_state != FC_OBJSTATE_ONLINE ||
 > -           !nvme_check_ready(&queue->ctrl->ctrl, rq, queue_ready))
 > -               return nvme_fail_nonready_command(&queue->ctrl->ctrl, 
rq);
 > -
 >         ret = nvme_setup_cmd(ns, rq);
 >         if (ret)
 >                 return ret;
 >
 > +       if (ctrl->rport->remoteport.port_state != FC_OBJSTATE_ONLINE ||
 > +           !nvme_check_ready(&queue->ctrl->ctrl, rq, queue_ready))
 > +               return nvme_fail_nonready_command(&queue->ctrl->ctrl, 
rq);
 > +

__nvme_check_ready() checks for (nvme_req(req)->flags & 
NVME_REQ_USERCMD).  In nvme_setup_cmd(), nvme_clear_nvme_request() 
clears the nvme_req(req)->flags when RQF_DONTPREP is not set.

Is it possible that this patch would have nvme_setup_cmd() erase a 
nvme_req(req)’s NVME_REQ_USERCMD flag before __nvme_check_ready() is 
called for each respective .queue_rq?

Regards,
Justin Tee


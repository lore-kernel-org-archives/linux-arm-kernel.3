Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40E3C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PL9pcPV+bgLn+N8hsfR6afv5u/5q3iwl14xc1NE3dOQ=; b=smqH/2LIDSl4+cXo2NzMhC/p8c
	dS7RttB2fkDasxapf1TcO7z9wBCtYXbX7GTfXk2U4UZq4Q7BPUPlTGsWpVYY7fd1W1x74iptulF7S
	IViD7g6/nXZ/jZVhLPFU1xxHtbaatIJOCoAC8SMf+3M/4FyvqDRcQ8A88WwUAlJ9lYXmjfNih55h2
	t6E4UV7xPkRORCqoaZnARAViAA9ALhSuDaobUFfr3qCYsVvswxeSz5cX2i6wAY0kChuaetvfZy4uW
	3u4EDBaTNbZ+AGXxp+bMRa6xnZcosapfUjydFuFpGtHisf6b6NI9yR9b7YChZ+/URklEYGP37b0FX
	fH08YH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ESX-0000000BGjz-2Ion;
	Wed, 09 Sep 2026 09:19:13 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ESU-0000000BGj7-3Nzn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:19:12 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843971bdd0so620128f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 02:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788945549; x=1789550349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PL9pcPV+bgLn+N8hsfR6afv5u/5q3iwl14xc1NE3dOQ=;
        b=PAdAiDwLj0T719iOD+WY2RPT0vaQETePwn9/yWHM5Ixftt2JnZfrBWrqIKOQwjJTXf
         uXc+IFFpip3tOl3zK4auPT3nPqdMdYRnU96FEUsFjh5ECEZoK2nxC+RXdZVuTjs1ZSjZ
         Rty+HenE7QG1qb3olRt/fQ7Y0SjS91Il3ZHZsv4zEAbGpRII/6LwsZ+EhD+aon/SQaD+
         ZFFZfMLAxW1gyYc4kSr5TFl/ltwqzk3tM9b/kjLvYMeDw+Kl9nkliek+z914mYaOB44s
         hfvJUKvf9F/obUt0xjrbL1u4cHrcDiHA+VfA9ilaCKPJvy+abMWiqyA7mTW/vw+Mt9b5
         n/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945549; x=1789550349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PL9pcPV+bgLn+N8hsfR6afv5u/5q3iwl14xc1NE3dOQ=;
        b=gtbiqUwurFOYfxybKAJMEcQb1HPgzKZn815aeXRwJHfCP81wne5s8cGb2bXKETGriQ
         CJ3PRknSQuxWpp+jpsFW3k0lmV3X/6JheR+NoLyqEm4tmjYmgpz+T9cWTNyHnf33IgqO
         vnrgVMlv1WLMMiuzgNF0Z6+QlFU/fNO7nlcl0/B5FMg9fvcEg0W5Gx/6FRPvrC+qoWIU
         BvwdVUwpp4qb6wUST98qbOW88pzDhUHi/AyOSkQdFZz/i88aE2aXfU4pjKCrBvbe8OdK
         TEYuIbpuNiNDnBd7jls5/9SRJo7HNypWX+iP6HttTv8HJrt/BAjIlszSJqoghtVq2VpB
         S3Rw==
X-Forwarded-Encrypted: i=1; AKwUvBxL1CSPBoLHHUbqyCp3IeYmrmP+29VnWE2l1Ab2D0eoxtUtjB0rXpe8RZy/DgcQtSlfPl4gVmrDFHKkLmh10pke@lists.infradead.org
X-Gm-Message-State: AFuF++nFDeitw1i+Ecx3a3kiSk65LAIgrSK76Vs1IwzRJ4rYbWU+DGGc
	UEhObDpqvWHYKsDgKaN4JZxbqAxuZUyGQ9UQHDDVISks5MZMRP7b3agS
X-Gm-Gg: AYBFou2zPJZwnYyrzIg9C3qqFHDDweAGDUc4JTNnXiB9TG8HqyVrDSeo1YRW4Kphu+N
	+/BiL/685MCfBaksT1U7QOFPxda5sy90LNfmslOmPaNuYPW85Hm32JHziyGZhktNcWmq2ka8E7S
	w6KAHU2ItfTqames86ch5OgFzQOLDXRu0w7MUgP+nb7GJPMyLilbg0tNWyfxg3xqYp1gsMg3Ofq
	UoPzQvhUYwNutS+E5gDY5AmboxXmj61j7NTuRZw2jHBLREpVbgr1Hhuod50zOxVJCjd98hQIxX1
	kXD4WnZkvbh0GkZg1ee5oT5QYUFT83fgv7wpeKDBa2XXN1UdPFu7uSHc/F6j9ReUcfECjPw8C1E
	XgBVQUoh9e6F5x04fpFgxHkTfIj7/pEcizPm0XVzxe31nZqljRRua0VUv//hSyAKccpQMDOdAjN
	CL+0DUm8Y2F1PizVmXisoUJoKbebVU14J5JxRdL7mWlU99NkfiVhtmX9L69aMD/sL/izSY8CsWO
	Hz+zggJWCBPCM8CYIXVB5b/zsZ1bv7cfPcfETnNKo8VjvcU7HWSqQj73NHlc6zX0DLNxRa/gi87
	Ah69
X-Received: by 2002:a05:6000:25ed:b0:485:82f7:9053 with SMTP id ffacd0b85a97d-48589246177mr34007529f8f.1.1788945548438;
        Wed, 09 Sep 2026 02:19:08 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8369007971AC9F7C06630F.dsl.pool.telekom.hu. [2001:4c4e:1b83:6900:7971:ac9f:7c06:630f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm41822588f8f.3.2026.09.09.02.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:19:07 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: rockchip: rk3588: add an OPP table for the NPU
Date: Wed,  9 Sep 2026 11:18:24 +0200
Message-ID: <20260909091825.10838-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <c58d711ff5c9a01cfd69c2ddf86bfd969b36cc63.camel@ndufresne.ca>
References: <c58d711ff5c9a01cfd69c2ddf86bfd969b36cc63.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_021911_059598_3E596F81 
X-CRM114-Status: GOOD (  35.30  )
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

On Mon, 2026-09-08 at 15:44 -0400, Nicolas Dufresne wrote:

Thank you for taking the time on this - and no worries about the PoC not
being posted; the credit in the commit message was deliberate, the rates
and voltages really were arrived at twice independently.

> My impression, and I was to study this properly is that having the same
> table on every core and adding the opp-shared set on it was actually
> probably the proper way to describe this "single clock for all"
> relationship.
> [...]
> I'm curious what's the right approach, and what is the real meaning of
> opp-shared if I got that wrong.

You got it right, and I got it wrong. The binding says (opp-v2-base.yaml):

  opp-shared: Indicates that device nodes using this OPP Table Node's
  phandle switch their DVFS state together, i.e. they share
  clock/voltage/current lines. Missing property means devices have
  independent clock/voltage/current lines, but they share OPP tables.

That is exactly the hardware here: one compute clock and one supply for
all three cores. And it is not only documentation for non-CPU devices
either: in drivers/opp/of.c, _managed_opp() only lets several devices
share a single opp_table instance when the table node carries opp-shared;
without it each device that points at the same node gets its own table.

So the accurate description is the one you had: the same phandle on
rknn_core_0/1/2 plus opp-shared on the table. Putting the table on core 0
alone describes core 0 and says nothing about the other two, which is a
worse description of the same hardware. I will change this in v2 unless a
DT maintainer disagrees.

One consequence is mine to fix on the driver side, not yours to work
around in DT: the driver currently picks the core that carries the table
by taking the first core whose node has operating-points-v2. With three
carriers that choice - and with it the name under /sys/class/devfreq -
would follow whichever core bound first. That is a driver bug the moment
the DT stops being lopsided, so it gets fixed in the same v2.

> We must not justify our DTS choices based on driver behaviours (or miss-
> behaviour). We must justify it based on how accurate the hardware
> description is.
> [...]
> It should probably be fine to not use opp-suspend, if transition back to
> 200Mhz works. It not fine if its to avoid a driver deadlock (argually due
> to a bug).

Accepted, and it is a fair hit. The paragraph as written justifies a DT
choice with a driver limitation, and that is backwards regardless of
whether the limitation is real. It comes out in v2.

On the meaning: your interpretation matches mine, and it is stronger than
"descriptive". The binding says opp-suspend "marks the OPP to be used
during device suspend", and the devfreq core acts on it directly -
devfreq_add_device() reads it into devfreq->suspend_freq, and
devfreq_suspend_device() then sets that rate.

Which leaves the question you actually asked, so I measured it rather than
argued it. On an Orange Pi 5 Plus with this series applied, in-tree rocket,
the OPP table of 3/7 read out of DT, simple_ondemand with min_freq/max_freq
left alone: 25 s of inference, then 60 s idle.

  - The governor takes it back down on its own. trans_stat records six
    transitions for the run - 200->1000, 1000->800, 800->1000, 1000->900,
    900->500, 500->200 - and then 60129 ms at 200 MHz with zero
    milliseconds at any other level for the rest of the window. The step
    down happened within one 250 ms sample of the load ending.

  - The transition completed, it was not merely requested. vdd_npu_s0 goes
    700 -> 850 mV under load and sits flat at 700 mV for the whole idle
    window. In _set_opp(), when scaling down, config_regulators() runs only
    after config_clks() has returned success, so the supply could not have
    come back down to the 200 MHz voltage if the SCMI clock set had failed.
    All four voltages of the table were exercised: 700, 750, 800 and 850 mV.

  - The clock summary in debugfs agrees, reading 200000000 for scmi_clk_npu
    after the load. I only sampled it after the load, so I am offering it as
    consistent rather than as an independent check.

So the transition back works here, and by your own criterion it is fine not
to use opp-suspend. This is one board and one part, so I would not call it
more than that.

Two things I want to keep apart rather than join with a "therefore", because
joining them is what made the original paragraph wrong:

  - What guarantees the rate across suspend is the driver, not the governor
    and not the DT. rocket_devfreq_suspend() in 5/7 sets the recorded boot
    rate itself on the system suspend path, and 4/7 restores it before the
    last core goes down and on .shutdown. That is the answer to "is it safe
    without opp-suspend".

  - Whether the governor walks back down to 200 MHz when the NPU goes idle
    is a separate fact, and it is the one you asked me to check. It does.

opp-suspend acts on the first of those. Since the driver already puts the
device back at its boot rate on that path, the property has nothing left to
do here - and that, rather than any deadlock, is the argument v2 will make.

Worth saying plainly: every number in the cover was taken with the limits
pinned by hand, so this is the first time the governor was left to decide
anything on this board. Your question is what exposed that.

> This is irrelevant, I think you can drop this paragraph.

Agreed, dropped in v2.

> Ack, this is safe thing to do.

Thanks.

Regards,
Igor


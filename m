Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CD7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 10:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSnZ0Mx4mizg0acLlif+7AZWMWB8JycxaVkhyVnyK8I=; b=xuDsmMExcl18MGSnMRDxP69ECx
	h5JG0Pb7D/zMkq43dobIJEsNfFw+L/tQS2CWiH7n0WXNZWaU3Z+Tfz/fL+nfeguL0OS083Q0zp5Od
	6ufq3LbMdwJwLLoKmfz+B7tldhWbEREsmXpchXbkLDs70injFeYizI2mTcbQPvN7zmjhxRbLPlMnX
	uqly0+HQLF5YS4EPD4XYUdgn72uV/qoglMevdiKmRJXUCl+reF3mI/Tzv1/Soo/IcUWF6mQTe0Nhf
	fD0uZMWbZDiewBBpg1Jy920gpSpiYHbNIn1Y+SwUKPQOGLY6nA3xxvr8iQR2apyn0wJodpnpRXaBr
	G+U6CCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNV6v-0000000DAS5-08d2;
	Tue, 17 Dec 2024 10:47:29 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNV5p-0000000DAH6-2a5z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 10:46:22 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53f22fd6887so5189546e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 02:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734432379; x=1735037179; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JSnZ0Mx4mizg0acLlif+7AZWMWB8JycxaVkhyVnyK8I=;
        b=UvAk52lOblQQHS/fMR66If9Kwu2xkH18XzvFMUoV8+AKcJE+0X74a7sOw2kTy7dIcy
         RrNLQpDF4f5iMwOWpH7SzdB7rqjGjtEKCxe0Dg55d3eYdDyUBWkaWSzuuMsyfoP0VD9Y
         cT3DNOgPb4oTchJaWcBtf+ZLBOCuAZ4kGTtC1kECp3pwl4sgbQebgA0BV4KsoZgyHPku
         37iYfXt6TaXHmUDjIYxfrKcbCE5KNjh936jWcxqAhfxmJdLQc8L9UcrJ3tLE5hVhyCJU
         TD7evrVbJIGRkm+te5GSp8+7vVsyu1hyyNHMybAop1KLF1OCYKZdSavBBrKxJZEN8Kvy
         B+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734432379; x=1735037179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSnZ0Mx4mizg0acLlif+7AZWMWB8JycxaVkhyVnyK8I=;
        b=LsMV7EnCaLwqRRgN/yW6ormeK/JurxalTMopcj7bqQMoFBhg+yefDtz9aGSzFJ1bfZ
         Uj4cQAwKJKDSm7xqB7JTKlmP6X7ODnMSWv+jQa5cJRmNL8kn/pP6VFG7UbpirqJTEdSD
         8VClFG0WB9p1WpT7h8vvLQgaKr73OvGSYMRkAfWpeYRChYCJK3Nj27xaVdqRaMbCXbil
         TjZB4vHhw9oa75vkX6Z1hnqify+mRLerooqzjONS+WLXrIt6QAn7uMvfuG2kvJhUkcOR
         npEUJrKeVhJzJ/rbP/BNiYzM7trg2YJPdv3xGoFVSXi6Nc39LasgzJ6ccOH59JMafLgi
         FdVA==
X-Forwarded-Encrypted: i=1; AJvYcCX4FovufpFrFK9+CSQPSreVxiM7GX12rGlFb/qtjWDmIeG7JcZYBzNnk4RAYwwZw3745VKo5ATT5aVUaNfVcINw@lists.infradead.org
X-Gm-Message-State: AOJu0YwVdgip7Y/eHLiDU9trnHNgUHuScdqIivAy2zlqaHw3XikwoxUL
	ddJVy7wlDBtmUgLY4DgMX6ruUwo21951GWei2INF+hs7VqA9ZMlcYOzXMN2vSkY=
X-Gm-Gg: ASbGncu+iEovT/3JAT3y3jsPo9U66rqdYovD74KTTOBL9ZksX2kAwGwyhZzpyyJtFCT
	oT3wnFLCUyxq/OrMWM1VjUZSEC6Mp3kUMwU49d2A4cF0YZSdPyvQbAUEZXArXn8u2gsCyyIxrrn
	hEHQ56jBw/TtryiTK+I8zMhJMuXYgMBBCE5mDkDJXioqgK6Um5CG9EQqraRF6pdzEHYc5YvJ6/S
	/UEzP9RIkL/SzpCP2xFXAzHoSunfIzD7lMmf/3M3VpK63+DuRhbeRLaCPZk02UJfSk1QBQBh7Ih
	ExKuaZDFuGvg60LjFQF9BahhmmtbCFpyD0q3
X-Google-Smtp-Source: AGHT+IFtdnVnrp1/gspKbWgsAMJI+1h5/kNF3qFQhCksGg4KzJBNmIkm4ZMGj0ADHd8QexsymwkNwA==
X-Received: by 2002:a05:6512:3d09:b0:540:1e75:4bdc with SMTP id 2adb3069b0e04-540905aad0dmr5140888e87.38.1734432379074;
        Tue, 17 Dec 2024 02:46:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c13c3asm1102025e87.210.2024.12.17.02.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 02:46:17 -0800 (PST)
Date: Tue, 17 Dec 2024 12:46:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: myungjoo.ham@samsung.com, Kyungmin.park@samsung.com, 
	cw00.choi@samsung.com, Viresh Kumar <viresh.kumar@linaro.org>, sudeep.holla@arm.com, 
	cristian.marussi@arm.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org, 
	arm-scmi@vger.kernel.org, Amir Vajid <avajid@quicinc.com>
Subject: Re: [PATCH V4 4/5] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
Message-ID: <uwwiz2o6brn5zczbpaiajdq7yva2qpcpgzwdr26lhg4jvlwvvj@w5bkiuhdalze>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-5-quic_sibis@quicinc.com>
 <2aycrvnvivcrqctqmweadcgenwugafdr6ub3bzkscterpenz32@bzabln2hkral>
 <29eef87e-96f6-5105-6f7a-a8e01efcb4a3@quicinc.com>
 <k4lpzxtrq3x6riyv6etxiobn7nbpczf2bp3m4oc752nhjknlit@uo53kbppzim7>
 <ac655bdc-5ccf-c6c6-3203-659f1916c53c@quicinc.com>
 <34p27za5hcpubaxjuddsir2vqnqrvwyesnclu2cocvm3yhbv3r@ak7rcnp67gyd>
 <1f5258f4-7c20-5343-dec6-0847449c821b@quicinc.com>
 <CAA8EJpoN3QSi72UUDV+=YkqySgXkiODUFJvwpBYfSmnkSotuZA@mail.gmail.com>
 <4399f7da-9478-57c0-7405-e51dc35d90ba@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4399f7da-9478-57c0-7405-e51dc35d90ba@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_024621_656130_D3A42A7D 
X-CRM114-Status: GOOD (  29.86  )
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

On Tue, Dec 17, 2024 at 03:46:24PM +0530, Sibi Sankar wrote:
> 
> 
> On 12/5/24 17:00, Dmitry Baryshkov wrote:
> > On Thu, 5 Dec 2024 at 12:53, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 11/14/24 18:02, Dmitry Baryshkov wrote:
> > > > On Thu, Nov 14, 2024 at 09:43:53AM +0530, Sibi Sankar wrote:
> > > > > 
> > > > > 
> > > > > On 10/26/24 23:46, Dmitry Baryshkov wrote:
> > > > > > On Tue, Oct 22, 2024 at 01:48:25PM +0530, Sibi Sankar wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 10/7/24 23:27, Dmitry Baryshkov wrote:
> > > > > > > > On Mon, Oct 07, 2024 at 11:40:22AM GMT, Sibi Sankar wrote:
> > > > 
> > > > > > > > 
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +struct map_param_msg {
> > > > > > > > > +        u32 hw_type;
> > > > > > > > > +        u32 mon_idx;
> > > > > > > > > +        u32 nr_rows;
> > > > > > > > > +        struct map_table tbl[MAX_MAP_ENTRIES];
> > > > > > > > > +} __packed;
> > > > > > > > > +
> > > > > > > > > +struct node_msg {
> > > > > > > > > +        u32 cpumask;
> > > > > > > > > +        u32 hw_type;
> > > > > > > > > +        u32 mon_type;
> > > > > > > > > +        u32 mon_idx;
> > > > > > > > > +        char mon_name[MAX_NAME_LEN];
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +struct scalar_param_msg {
> > > > > > > > > +        u32 hw_type;
> > > > > > > > > +        u32 mon_idx;
> > > > > > > > > +        u32 val;
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +enum common_ev_idx {
> > > > > > > > > +        INST_IDX,
> > > > > > > > > +        CYC_IDX,
> > > > > > > > > +        CONST_CYC_IDX,
> > > > > > > > > +        FE_STALL_IDX,
> > > > > > > > > +        BE_STALL_IDX,
> > > > > > > > > +        NUM_COMMON_EVS
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +enum grp_ev_idx {
> > > > > > > > > +        MISS_IDX,
> > > > > > > > > +        WB_IDX,
> > > > > > > > > +        ACC_IDX,
> > > > > > > > > +        NUM_GRP_EVS
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +#define EV_CPU_CYCLES           0
> > > > > > > > > +#define EV_INST_RETIRED         2
> > > > > > > > > +#define EV_L2_D_RFILL           5
> > > > > > > > > +
> > > > > > > > > +struct ev_map_msg {
> > > > > > > > > +        u32 num_evs;
> > > > > > > > > +        u32 hw_type;
> > > > > > > > > +        u32 cid[NUM_COMMON_EVS];
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +struct cpufreq_memfreq_map {
> > > > > > > > > +        unsigned int cpufreq_mhz;
> > > > > > > > > +        unsigned int memfreq_khz;
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +struct scmi_monitor_info {
> > > > > > > > > +        struct cpufreq_memfreq_map *freq_map;
> > > > > > > > > +        char mon_name[MAX_NAME_LEN];
> > > > > > > > > +        u32 mon_idx;
> > > > > > > > > +        u32 mon_type;
> > > > > > > > > +        u32 ipm_ceil;
> > > > > > > > > +        u32 mask;
> > > > > > > > > +        u32 freq_map_len;
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +struct scmi_memory_info {
> > > > > > > > > +        struct scmi_monitor_info *monitor[MAX_MONITOR_CNT];
> > > > > > > > > +        u32 hw_type;
> > > > > > > > > +        int monitor_cnt;
> > > > > > > > > +        u32 min_freq;
> > > > > > > > > +        u32 max_freq;
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +struct scmi_memlat_info {
> > > > > > > > > +        struct scmi_protocol_handle *ph;
> > > > > > > > > +        const struct qcom_generic_ext_ops *ops;
> > > > > > > > > +        struct scmi_memory_info *memory[MAX_MEMORY_TYPES];
> > > > > > > > > +        u32 cluster_info[NR_CPUS];
> > > > > > > > > +        int memory_cnt;
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +static int populate_cluster_info(u32 *cluster_info)
> > > > > > > > > +{
> > > > > > > > > +        char name[MAX_NAME_LEN];
> > > > > > > > > +        int i = 0;
> > > > > > > > > +
> > > > > > > > > +        struct device_node *cn __free(device_node) = of_find_node_by_path("/cpus");
> > > > > > > > > +        if (!cn)
> > > > > > > > > +                return -ENODEV;
> > > > > > > > > +
> > > > > > > > > +        struct device_node *map __free(device_node) = of_get_child_by_name(cn, "cpu-map");
> > > > > > > > > +        if (!map)
> > > > > > > > > +                return -ENODEV;
> > > > > > > > > +
> > > > > > > > > +        do {
> > > > > > > > > +                snprintf(name, sizeof(name), "cluster%d", i);
> > > > > > > > > +                struct device_node *c __free(device_node) = of_get_child_by_name(map, name);
> > > > > > > > > +                if (!c)
> > > > > > > > > +                        break;
> > > > > > > > > +
> > > > > > > > > +                *(cluster_info + i) = of_get_child_count(c);
> > > > > > > > > +                i++;
> > > > > > > > > +        } while (1);
> > > > > > > > 
> > > > > > > > Can you use existing API from drivers/base/arch_topology.c? If not, can
> > > > > > > > it be extended to support your usecase?
> > > > > > > 
> > > > > > > ack. But I'm pretty sure it's going to take a while for reaching such
> > > > > > > an agreement so I'll drop this feature during the next re-spin.
> > > > > > 
> > > > > > Why? What kind of API do you actually need? The arch_topology.c simply
> > > > > > exports a table of struct cpu_topology. Is it somehow different from
> > > > > > what you are parsing manually?
> > > > > 
> > > > > yup, we had to figure out the physical id of the cpu
> > > > > since cpus can be disabled by the bootloader using
> > > > > status = "failed" property and we have to pass this
> > > > > onto the cpucp memlat algorithm.
> > > > 
> > > > Isn't it equal to the index in the cpu_topology table?
> > > 
> > > from what I see cpu_topology indexes remain unpopulated
> > > for cpus that are disabled since get_cpu_for_node
> > > ignores those?
> > 
> > Why do you need cpu_topology for disabled aka non-existing CPU devices?
> 
> sorry was out sick couldn't back earlier. We need the know
> what cpus are disbled to pass on the correct mask of cpus
> enabled to the SCP.

Yes. So isn't it enough to know only the enabled CPUs?


-- 
With best wishes
Dmitry


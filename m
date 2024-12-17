Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE28BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 12:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGJtgkW0Nmj+9bOR6wvgP6qiuxfS0r3vmJTy/VNYYyI=; b=Qia97h8Idwx0sUrXBmMtqczcMP
	k+zirRfydCiIPZDN6aCp6D+LIOArSpaGP3xmOmZj+fGS+9PNQUSnhVZrhtvhGrj2NPlHlmqs2yjCD
	OYkBeHcTHuzxDfu6KsMd1rK2lqMwdx4sj9NJJwJjG8lU/7epURXtJs2OzjtxFQxa++V/e9lftCAEj
	NDqW2GfG6rVwLum+WvzyM6NLnYJCWxN1Iei4FrHiPla6Vjqh39H9EJ2bEGYO6ApshtIYqiSMAwBNl
	2RROh1S2U0gJK8F6oXFupWs4a/rQYTuT7UsuG+oxPxhu4DHLPu4pqSToi8YaDJ2bOtyDN8+tCSbJy
	SEzcaMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWQ7-0000000DM7e-3jDB;
	Tue, 17 Dec 2024 12:11:23 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWP2-0000000DLwl-3VeC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 12:10:17 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30227c56b11so52112901fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 04:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734437415; x=1735042215; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SGJtgkW0Nmj+9bOR6wvgP6qiuxfS0r3vmJTy/VNYYyI=;
        b=Fs3TRnS2/g2/LfKNd+zOFnymKT/ZtAPJSR7PZkhUOWFt/0tXtVYmWOUQb4482dAxg5
         VOftp4Ge31Sc0mltlTdv1Ob5ctzw1CrL8th+PyJCsvxHxDLl3VS+vd2EZx2RyMqBmKKV
         kYCIOSkSVteWIAkhNEIf5YkovnGEp/mZBUTchqHUYdHZEYlwk/IyTJrtstw86uxDO4gS
         3vXWDQ1r00tULQn+jfweq9o25Tu7/wFdCNzfdo1l+iSiCIRwqOynfj0UrEXh6OnMruch
         vFc3kZV4xj0eEqySdWqWxXQsW0HFkCt9n7h/df/Tp3mci1WYIqRIzzpQEV+a5kNYFEEJ
         wxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734437415; x=1735042215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGJtgkW0Nmj+9bOR6wvgP6qiuxfS0r3vmJTy/VNYYyI=;
        b=WxlZwiTi+nz9rVH57uEKVI3WYPhnRaXlOpDzbLfvvlrvSKmeA+UnsXbE1ZCgGj0eZJ
         TNgmTYpaJ7LT4hekYyW10qhfYCR1PO2vR7SCCYkgTKuY1ughdSonVeEWKlfCqAjtdxkr
         xwsZ/8E7CctizihJEkx55vr+DKD1wT+ez8LVNomj0gmhDoSHpNw3M3aXC2SeGeyBGvCc
         ti7k+79hgzvNFj0CutmRWHUvQm2pneKJygeP8pmFM3fppUapKJYvcOsXteq9jajfp1B3
         Wc/486kr+z0emTGgdwXyIXlG1QxYe8Y0I61tT7T6/527HWNp4Dw//+kyPJ4DE2Bc6SZ5
         wxXw==
X-Forwarded-Encrypted: i=1; AJvYcCWWyMRGQjl62CxZIc6W389FoZ9eT2T7nwSeNZVT1jLI28G+7I3yD4LA8BZR5I4ddWV7kWZH/g0ArvGqMeQWLr56@lists.infradead.org
X-Gm-Message-State: AOJu0YxXkMXgIg93iyGAnHYBhtqMzOt3NSqMN0WqHPapvlSMt5b3aY8G
	sLfUdOL8fwlqEv9ATdSPnZ/Mm7LFgUidJw37Qpf9IfUGo3/b0qGmOuzUTKA57e8=
X-Gm-Gg: ASbGncvQTqpwcsTe88Ic81JSV8CbESs4hta86NZxW6gSpfnxp/EvHh5NIMrHRbIdaJr
	+2MehaoN1rSvWP/KnJMh6t6Dx9IvVl8w0mzgrbI5L78iyeOeH4fMqB8/htiRgxWn/cYLhLy16xe
	NKZPYt1GZpgMn+iUe6dnu5VI5xtHhzSixa7CuOu8i7ZKiMnCCURpyhw/UnpmxwYIAM3giHy6fTl
	cgMYoPBfO8yErbIsTmLy6tbiUnrqXZqRucLgWJkHubo0TUwvRLf6ZJV4WmbSURLLZBPsftSo6Zl
	LdbmsBlM6sO0O+v9yJKfGmWOVxNJtFVOD+br
X-Google-Smtp-Source: AGHT+IGbaAsWRmA6m2AAATXZlP1PqfEe6QwBDePHMk1dARQJ/q4HNRCc/Wnqkc8Q0vklBj+coP542A==
X-Received: by 2002:a05:651c:504:b0:302:360e:a13b with SMTP id 38308e7fff4ca-304435690d3mr13712661fa.30.1734437415091;
        Tue, 17 Dec 2024 04:10:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441a5a8dsm12382381fa.108.2024.12.17.04.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 04:10:14 -0800 (PST)
Date: Tue, 17 Dec 2024 14:10:13 +0200
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
Message-ID: <7xrvku7wfvrpxx6yvamn7so46k4dvezpebj7ctm56ufp5ajadi@jwzup6vkupvd>
References: <2aycrvnvivcrqctqmweadcgenwugafdr6ub3bzkscterpenz32@bzabln2hkral>
 <29eef87e-96f6-5105-6f7a-a8e01efcb4a3@quicinc.com>
 <k4lpzxtrq3x6riyv6etxiobn7nbpczf2bp3m4oc752nhjknlit@uo53kbppzim7>
 <ac655bdc-5ccf-c6c6-3203-659f1916c53c@quicinc.com>
 <34p27za5hcpubaxjuddsir2vqnqrvwyesnclu2cocvm3yhbv3r@ak7rcnp67gyd>
 <1f5258f4-7c20-5343-dec6-0847449c821b@quicinc.com>
 <CAA8EJpoN3QSi72UUDV+=YkqySgXkiODUFJvwpBYfSmnkSotuZA@mail.gmail.com>
 <4399f7da-9478-57c0-7405-e51dc35d90ba@quicinc.com>
 <uwwiz2o6brn5zczbpaiajdq7yva2qpcpgzwdr26lhg4jvlwvvj@w5bkiuhdalze>
 <d2d95756-c51d-17bb-ce12-d8ae390a3bac@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2d95756-c51d-17bb-ce12-d8ae390a3bac@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_041016_876648_3DAEB293 
X-CRM114-Status: GOOD (  30.80  )
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

On Tue, Dec 17, 2024 at 04:35:15PM +0530, Sibi Sankar wrote:
> 
> 
> On 12/17/24 16:16, Dmitry Baryshkov wrote:
> > On Tue, Dec 17, 2024 at 03:46:24PM +0530, Sibi Sankar wrote:
> > > 
> > > 
> > > On 12/5/24 17:00, Dmitry Baryshkov wrote:
> > > > On Thu, 5 Dec 2024 at 12:53, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 11/14/24 18:02, Dmitry Baryshkov wrote:
> > > > > > On Thu, Nov 14, 2024 at 09:43:53AM +0530, Sibi Sankar wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 10/26/24 23:46, Dmitry Baryshkov wrote:
> > > > > > > > On Tue, Oct 22, 2024 at 01:48:25PM +0530, Sibi Sankar wrote:
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > On 10/7/24 23:27, Dmitry Baryshkov wrote:
> > > > > > > > > > On Mon, Oct 07, 2024 at 11:40:22AM GMT, Sibi Sankar wrote:
> > > > > > 
> > > > > > > > > > 
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +struct map_param_msg {
> > > > > > > > > > > +        u32 hw_type;
> > > > > > > > > > > +        u32 mon_idx;
> > > > > > > > > > > +        u32 nr_rows;
> > > > > > > > > > > +        struct map_table tbl[MAX_MAP_ENTRIES];
> > > > > > > > > > > +} __packed;
> > > > > > > > > > > +
> > > > > > > > > > > +struct node_msg {
> > > > > > > > > > > +        u32 cpumask;
> > > > > > > > > > > +        u32 hw_type;
> > > > > > > > > > > +        u32 mon_type;
> > > > > > > > > > > +        u32 mon_idx;
> > > > > > > > > > > +        char mon_name[MAX_NAME_LEN];
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +struct scalar_param_msg {
> > > > > > > > > > > +        u32 hw_type;
> > > > > > > > > > > +        u32 mon_idx;
> > > > > > > > > > > +        u32 val;
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +enum common_ev_idx {
> > > > > > > > > > > +        INST_IDX,
> > > > > > > > > > > +        CYC_IDX,
> > > > > > > > > > > +        CONST_CYC_IDX,
> > > > > > > > > > > +        FE_STALL_IDX,
> > > > > > > > > > > +        BE_STALL_IDX,
> > > > > > > > > > > +        NUM_COMMON_EVS
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +enum grp_ev_idx {
> > > > > > > > > > > +        MISS_IDX,
> > > > > > > > > > > +        WB_IDX,
> > > > > > > > > > > +        ACC_IDX,
> > > > > > > > > > > +        NUM_GRP_EVS
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +#define EV_CPU_CYCLES           0
> > > > > > > > > > > +#define EV_INST_RETIRED         2
> > > > > > > > > > > +#define EV_L2_D_RFILL           5
> > > > > > > > > > > +
> > > > > > > > > > > +struct ev_map_msg {
> > > > > > > > > > > +        u32 num_evs;
> > > > > > > > > > > +        u32 hw_type;
> > > > > > > > > > > +        u32 cid[NUM_COMMON_EVS];
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +struct cpufreq_memfreq_map {
> > > > > > > > > > > +        unsigned int cpufreq_mhz;
> > > > > > > > > > > +        unsigned int memfreq_khz;
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +struct scmi_monitor_info {
> > > > > > > > > > > +        struct cpufreq_memfreq_map *freq_map;
> > > > > > > > > > > +        char mon_name[MAX_NAME_LEN];
> > > > > > > > > > > +        u32 mon_idx;
> > > > > > > > > > > +        u32 mon_type;
> > > > > > > > > > > +        u32 ipm_ceil;
> > > > > > > > > > > +        u32 mask;
> > > > > > > > > > > +        u32 freq_map_len;
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +struct scmi_memory_info {
> > > > > > > > > > > +        struct scmi_monitor_info *monitor[MAX_MONITOR_CNT];
> > > > > > > > > > > +        u32 hw_type;
> > > > > > > > > > > +        int monitor_cnt;
> > > > > > > > > > > +        u32 min_freq;
> > > > > > > > > > > +        u32 max_freq;
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +struct scmi_memlat_info {
> > > > > > > > > > > +        struct scmi_protocol_handle *ph;
> > > > > > > > > > > +        const struct qcom_generic_ext_ops *ops;
> > > > > > > > > > > +        struct scmi_memory_info *memory[MAX_MEMORY_TYPES];
> > > > > > > > > > > +        u32 cluster_info[NR_CPUS];
> > > > > > > > > > > +        int memory_cnt;
> > > > > > > > > > > +};
> > > > > > > > > > > +
> > > > > > > > > > > +static int populate_cluster_info(u32 *cluster_info)
> > > > > > > > > > > +{
> > > > > > > > > > > +        char name[MAX_NAME_LEN];
> > > > > > > > > > > +        int i = 0;
> > > > > > > > > > > +
> > > > > > > > > > > +        struct device_node *cn __free(device_node) = of_find_node_by_path("/cpus");
> > > > > > > > > > > +        if (!cn)
> > > > > > > > > > > +                return -ENODEV;
> > > > > > > > > > > +
> > > > > > > > > > > +        struct device_node *map __free(device_node) = of_get_child_by_name(cn, "cpu-map");
> > > > > > > > > > > +        if (!map)
> > > > > > > > > > > +                return -ENODEV;
> > > > > > > > > > > +
> > > > > > > > > > > +        do {
> > > > > > > > > > > +                snprintf(name, sizeof(name), "cluster%d", i);
> > > > > > > > > > > +                struct device_node *c __free(device_node) = of_get_child_by_name(map, name);
> > > > > > > > > > > +                if (!c)
> > > > > > > > > > > +                        break;
> > > > > > > > > > > +
> > > > > > > > > > > +                *(cluster_info + i) = of_get_child_count(c);
> > > > > > > > > > > +                i++;
> > > > > > > > > > > +        } while (1);
> > > > > > > > > > 
> > > > > > > > > > Can you use existing API from drivers/base/arch_topology.c? If not, can
> > > > > > > > > > it be extended to support your usecase?
> > > > > > > > > 
> > > > > > > > > ack. But I'm pretty sure it's going to take a while for reaching such
> > > > > > > > > an agreement so I'll drop this feature during the next re-spin.
> > > > > > > > 
> > > > > > > > Why? What kind of API do you actually need? The arch_topology.c simply
> > > > > > > > exports a table of struct cpu_topology. Is it somehow different from
> > > > > > > > what you are parsing manually?
> > > > > > > 
> > > > > > > yup, we had to figure out the physical id of the cpu
> > > > > > > since cpus can be disabled by the bootloader using
> > > > > > > status = "failed" property and we have to pass this
> > > > > > > onto the cpucp memlat algorithm.
> > > > > > 
> > > > > > Isn't it equal to the index in the cpu_topology table?
> > > > > 
> > > > > from what I see cpu_topology indexes remain unpopulated
> > > > > for cpus that are disabled since get_cpu_for_node
> > > > > ignores those?
> > > > 
> > > > Why do you need cpu_topology for disabled aka non-existing CPU devices?
> > > 
> > > sorry was out sick couldn't back earlier. We need the know
> > > what cpus are disbled to pass on the correct mask of cpus
> > > enabled to the SCP.
> > 
> > Yes. So isn't it enough to know only the enabled CPUs?
> 
> yes just knowing the physical index of the enabled cpus
> should be enough.

Then exiting cpu_topology is enough for your case, isn't it?

-- 
With best wishes
Dmitry


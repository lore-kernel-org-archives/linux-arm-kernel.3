Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82662D41D46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 12:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVLoP9XVBjH5taL4TpmDze9j1Zqat4TO/x8cVB0wKTk=; b=j5+v159vCX2ZObsLAnlnx/f1HU
	Pz/MqlRX4GqnG5EFmOjeftqSN2CxSwD5AQtNkO/xuB2oLbvCNVYKziga/wUkYtGXpzqdvwW5pwzau
	qq7VJt12+aRpKs3VktJy7dO3iAnJleRAtsIVemGEAK0cSbYnlE1Zdf5uXHXlc83lJOXyHeAkEExbn
	GOFfiygKrWBAIXEaafBpEZBVc/ETFomE3M1LUcQkh47g94kwOGCCLwhbCd7Xldc0/DKO9Y1t+jZCK
	p/jcxfaJG+hggXR4OVz5vko8VqkDZWlrqyviiVsFRwoFsGDtIoUb2aRzg0HyDPUEheg91dZtprNq8
	COipUuSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZ3l-00000009vVa-3YjR;
	Thu, 14 Nov 2024 12:34:53 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZ1v-00000009vDx-0b2R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 12:33:00 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2fb518014b9so4571451fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 04:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731587577; x=1732192377; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVLoP9XVBjH5taL4TpmDze9j1Zqat4TO/x8cVB0wKTk=;
        b=Hwb8qzyuEpIiv9f57zTCscSN75PyVxMctESBMNO3B4VOy/qJnoiNEJtkkLH/aJ/2eK
         +EyJZ3YVoLAKUWEbiMXTUCoxf3/pv32ycSv0lHAOdffXGOVAo6jTnto8GgB683CEmjg6
         0MgS1KSFh95L6vAwKtv0EXmTyDFFigAegBLXYgZwL6zssRzfmI/hl363+QfLFG6q0TJs
         hr2NKnIX8+ws5UUnAr62eQk9jojWN2JXF4WI2Ze/i7KAad7sYrbKesOEpmcZMWJdxdPJ
         zHgs/d9JJQS/oBk3aR7X0XmBvJSR7yuLb/G/VBO9k+ZaDxeEVY67WjnNTr7vC9q+kvQR
         Curg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731587577; x=1732192377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVLoP9XVBjH5taL4TpmDze9j1Zqat4TO/x8cVB0wKTk=;
        b=me5qG0Qq6Wrxp7mUU/bVmCRQNLc4tv25Ec8wOBy+Sd88AKrC32vNEKt2ao8JAcvCA8
         GNB1MIhIB/Y7QsMFJhcpHeVJGhlp5AAb7poXDAkc25ZJU8Vc4uiLxc82XbKEs5bcVOh5
         fJF6WVo1BOo4GyCRZ5ZZ8aXMlEXpBFlgyPuoqKxGVwcuLY9m8vJQ3pXXhojNCPSt8hr9
         BLlU9AlD+CsdjOYOmYj/kmGb3Va/wt0TC3y7PXp0ZRU/bA1LkWlvgqxkbD5u1PNFY0qt
         ADyROvl1c8WGZFzOLkxo0ncAUimudHIg5ecPyuF29X2QyKHZXWT2bI42buizl/pnCxAy
         z4Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWTkNLH+Nipi/S+8rOLFII1KMX8ySWVB+SMFsUQ9Lud8Uu9Oi+7uPqTVnR96CGKf5tMuzfthx2Jg7j0ZSnUaEE3@lists.infradead.org
X-Gm-Message-State: AOJu0YycTgFOigvjdaR8mjCCeKNNvfjvniRxe672kLxgew6MvEptvLud
	XePjTJiUjFotcK8SfYcMkr6YnxG3L1o7mXVOIKAupV6+KLiMo/vOKtu4kXOYoCY=
X-Google-Smtp-Source: AGHT+IH7G+Tz/0L4sqitxAHMiB7SEIXBc17jR80P2FR2ol6AYyOcDIRTQh+Yj4FOWT3Pv1+2j5CZ9A==
X-Received: by 2002:a05:651c:1589:b0:2fb:5bb8:7c24 with SMTP id 38308e7fff4ca-2ff20152825mr121200501fa.8.1731587576703;
        Thu, 14 Nov 2024 04:32:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff59764207sm1621871fa.13.2024.11.14.04.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 04:32:55 -0800 (PST)
Date: Thu, 14 Nov 2024 14:32:52 +0200
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
Message-ID: <34p27za5hcpubaxjuddsir2vqnqrvwyesnclu2cocvm3yhbv3r@ak7rcnp67gyd>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-5-quic_sibis@quicinc.com>
 <2aycrvnvivcrqctqmweadcgenwugafdr6ub3bzkscterpenz32@bzabln2hkral>
 <29eef87e-96f6-5105-6f7a-a8e01efcb4a3@quicinc.com>
 <k4lpzxtrq3x6riyv6etxiobn7nbpczf2bp3m4oc752nhjknlit@uo53kbppzim7>
 <ac655bdc-5ccf-c6c6-3203-659f1916c53c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac655bdc-5ccf-c6c6-3203-659f1916c53c@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_043259_241722_D392590B 
X-CRM114-Status: GOOD (  50.34  )
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

On Thu, Nov 14, 2024 at 09:43:53AM +0530, Sibi Sankar wrote:
> 
> 
> On 10/26/24 23:46, Dmitry Baryshkov wrote:
> > On Tue, Oct 22, 2024 at 01:48:25PM +0530, Sibi Sankar wrote:
> > > 
> > > 
> > > On 10/7/24 23:27, Dmitry Baryshkov wrote:
> > > > On Mon, Oct 07, 2024 at 11:40:22AM GMT, Sibi Sankar wrote:

> > > > 
> > > > > +};
> > > > > +
> > > > > +struct map_param_msg {
> > > > > +	u32 hw_type;
> > > > > +	u32 mon_idx;
> > > > > +	u32 nr_rows;
> > > > > +	struct map_table tbl[MAX_MAP_ENTRIES];
> > > > > +} __packed;
> > > > > +
> > > > > +struct node_msg {
> > > > > +	u32 cpumask;
> > > > > +	u32 hw_type;
> > > > > +	u32 mon_type;
> > > > > +	u32 mon_idx;
> > > > > +	char mon_name[MAX_NAME_LEN];
> > > > > +};
> > > > > +
> > > > > +struct scalar_param_msg {
> > > > > +	u32 hw_type;
> > > > > +	u32 mon_idx;
> > > > > +	u32 val;
> > > > > +};
> > > > > +
> > > > > +enum common_ev_idx {
> > > > > +	INST_IDX,
> > > > > +	CYC_IDX,
> > > > > +	CONST_CYC_IDX,
> > > > > +	FE_STALL_IDX,
> > > > > +	BE_STALL_IDX,
> > > > > +	NUM_COMMON_EVS
> > > > > +};
> > > > > +
> > > > > +enum grp_ev_idx {
> > > > > +	MISS_IDX,
> > > > > +	WB_IDX,
> > > > > +	ACC_IDX,
> > > > > +	NUM_GRP_EVS
> > > > > +};
> > > > > +
> > > > > +#define EV_CPU_CYCLES		0
> > > > > +#define EV_INST_RETIRED		2
> > > > > +#define EV_L2_D_RFILL		5
> > > > > +
> > > > > +struct ev_map_msg {
> > > > > +	u32 num_evs;
> > > > > +	u32 hw_type;
> > > > > +	u32 cid[NUM_COMMON_EVS];
> > > > > +};
> > > > > +
> > > > > +struct cpufreq_memfreq_map {
> > > > > +	unsigned int cpufreq_mhz;
> > > > > +	unsigned int memfreq_khz;
> > > > > +};
> > > > > +
> > > > > +struct scmi_monitor_info {
> > > > > +	struct cpufreq_memfreq_map *freq_map;
> > > > > +	char mon_name[MAX_NAME_LEN];
> > > > > +	u32 mon_idx;
> > > > > +	u32 mon_type;
> > > > > +	u32 ipm_ceil;
> > > > > +	u32 mask;
> > > > > +	u32 freq_map_len;
> > > > > +};
> > > > > +
> > > > > +struct scmi_memory_info {
> > > > > +	struct scmi_monitor_info *monitor[MAX_MONITOR_CNT];
> > > > > +	u32 hw_type;
> > > > > +	int monitor_cnt;
> > > > > +	u32 min_freq;
> > > > > +	u32 max_freq;
> > > > > +};
> > > > > +
> > > > > +struct scmi_memlat_info {
> > > > > +	struct scmi_protocol_handle *ph;
> > > > > +	const struct qcom_generic_ext_ops *ops;
> > > > > +	struct scmi_memory_info *memory[MAX_MEMORY_TYPES];
> > > > > +	u32 cluster_info[NR_CPUS];
> > > > > +	int memory_cnt;
> > > > > +};
> > > > > +
> > > > > +static int populate_cluster_info(u32 *cluster_info)
> > > > > +{
> > > > > +	char name[MAX_NAME_LEN];
> > > > > +	int i = 0;
> > > > > +
> > > > > +	struct device_node *cn __free(device_node) = of_find_node_by_path("/cpus");
> > > > > +	if (!cn)
> > > > > +		return -ENODEV;
> > > > > +
> > > > > +	struct device_node *map __free(device_node) = of_get_child_by_name(cn, "cpu-map");
> > > > > +	if (!map)
> > > > > +		return -ENODEV;
> > > > > +
> > > > > +	do {
> > > > > +		snprintf(name, sizeof(name), "cluster%d", i);
> > > > > +		struct device_node *c __free(device_node) = of_get_child_by_name(map, name);
> > > > > +		if (!c)
> > > > > +			break;
> > > > > +
> > > > > +		*(cluster_info + i) = of_get_child_count(c);
> > > > > +		i++;
> > > > > +	} while (1);
> > > > 
> > > > Can you use existing API from drivers/base/arch_topology.c? If not, can
> > > > it be extended to support your usecase?
> > > 
> > > ack. But I'm pretty sure it's going to take a while for reaching such
> > > an agreement so I'll drop this feature during the next re-spin.
> > 
> > Why? What kind of API do you actually need? The arch_topology.c simply
> > exports a table of struct cpu_topology. Is it somehow different from
> > what you are parsing manually?
> 
> yup, we had to figure out the physical id of the cpu
> since cpus can be disabled by the bootloader using
> status = "failed" property and we have to pass this
> onto the cpucp memlat algorithm.

Isn't it equal to the index in the cpu_topology table?

> 
> > 
> > > 
> > > > 
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static void populate_physical_mask(struct device_node *np, u32 *mask, u32 *cluster_info)
> > > > > +{
> > > > > +	struct device_node *dev_phandle __free(device_node);
> > > > > +	int cpu, i = 0, physical_id;
> > > > > +
> > > > > +	do {
> > > > > +		dev_phandle = of_parse_phandle(np, "cpus", i++);
> > > > > +		cpu = of_cpu_node_to_id(dev_phandle);
> > > > > +		if (cpu != -ENODEV) {
> > > > > +			physical_id = topology_core_id(cpu);
> > > > > +			for (int j = 0; j < topology_cluster_id(cpu); j++)
> > > > > +				physical_id += *(cluster_info + j);
> > > > > +			*mask |= BIT(physical_id);
> > > > > +		}
> > > > > +	} while (dev_phandle);
> > > > > +}
> > > > > +
> > > > > +static struct cpufreq_memfreq_map *init_cpufreq_memfreq_map(struct device *dev,
> > > > > +							    struct scmi_memory_info *memory,
> > > > > +							    struct device_node *of_node,
> > > > > +							    u32 *cnt)
> > > > > +{
> > > > > +	struct device_node *tbl_np __free(device_node), *opp_np __free(device_node);
> > > > > +	struct cpufreq_memfreq_map *tbl;
> > > > > +	int ret, i = 0;
> > > > > +	u32 level, len;
> > > > > +	u64 rate;
> > > > > +
> > > > > +	tbl_np = of_parse_phandle(of_node, "operating-points-v2", 0);
> > > > 
> > > > Please use existing API to parse OPP tables or document a reason why it
> > > > can't be used.
> > > 
> > > Thanks, I had them documented as opens in the coverletter. Dropped them
> > > since no one had any comments on it during V3. Will add them as comments
> > > to this driver instead.
> > > 
> > > https://lore.kernel.org/lkml/20240702191440.2161623-1-quic_sibis@quicinc.com/
> > > 
> > > re-copying things again:
> > > opp-tables are used but they don't get to be added to the scmi device
> > > (thus we rely on a lot of manual parsing) because the memlat client driver
> > > doesn't vote on these resources clocks/interconnects/power-domain
> > > from the kernel and some of the resources aren't modeled in the first
> > > place like DDR_QOS.
> > 
> > As discussed offline, please consider extending the OPP to be able to
> > get the struct opp_table for the particular phandle. Another option
> > might be to change the memlat driver by having a separate device for
> > each monitor. This way you can use existing API to parse OPP tables and
> > to get necessary data from those tables.
> 
> + Viresh
> 
> Spoke with Viresh offline and he had stricter requirements
> than what you proposed. He definitely wanted the opp-tables
> to be assoiciated with devices at the very least and have
> all opp parsing logic within the opp-framework. Given that
> we have to model all these dummy devices just to add the
> tables I'll re-check the feasibility of movign the tables
> into the driver itself. Will move the patch series back
> into RFC and re-post just the vendor protocol since that's
> close to merge

I don't think it's sensible to move the tables to the driver. Instead
adding a device per monitor sounds like a better idea.

> > > > > +	if (!tbl_np)
> > > > > +		return ERR_PTR(-ENODEV);
> > > > > +
> > > > > +	len = min(of_get_available_child_count(tbl_np), MAX_MAP_ENTRIES);
> > > > > +	if (len == 0)
> > > > > +		return ERR_PTR(-ENODEV);
> > > > > +
> > > > > +	tbl = devm_kzalloc(dev, (len + 1) * sizeof(struct cpufreq_memfreq_map),
> > > > > +			   GFP_KERNEL);
> > > > > +	if (!tbl)
> > > > > +		return ERR_PTR(-ENOMEM);
> > > > > +
> > > > > +	for_each_available_child_of_node(tbl_np, opp_np) {
> > > > > +		ret = of_property_read_u64_index(opp_np, "opp-hz", 0, &rate);
> > > > > +		if (ret < 0)
> > > > > +			return ERR_PTR(ret);
> > > > > +
> > > > > +		tbl[i].cpufreq_mhz = rate / HZ_PER_MHZ;
> > > > > +
> > > > > +		if (memory->hw_type != QCOM_MEM_TYPE_DDR_QOS) {
> > > > > +			ret = of_property_read_u64_index(opp_np, "opp-hz", 1, &rate);
> > > > > +			if (ret < 0)
> > > > > +				return ERR_PTR(ret);
> > > > > +
> > > > > +			tbl[i].memfreq_khz = rate / HZ_PER_KHZ;
> > > > > +		} else {
> > > > > +			ret = of_property_read_u32(opp_np, "opp-level", &level);
> > > > > +			if (ret < 0)
> > > > > +				return ERR_PTR(ret);
> > > > > +
> > > > > +			tbl[i].memfreq_khz = level;
> > > > > +		}
> > > > > +
> > > > > +		dev_dbg(dev, "Entry%d CPU:%u, Mem:%u\n", i, tbl[i].cpufreq_mhz, tbl[i].memfreq_khz);
> > > > > +		i++;
> > > > > +	}
> > > > > +	*cnt = len;
> > > > > +
> > > > > +	return tbl;
> > > > > +}
> > > > > +
> > > > > +static int process_scmi_memlat_of_node(struct scmi_device *sdev, struct scmi_memlat_info *info)
> > > > > +{
> > > > > +	struct scmi_monitor_info *monitor;
> > > > > +	struct scmi_memory_info *memory;
> > > > > +	char name[MAX_NAME_LEN];
> > > > > +	u64 memfreq[2];
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = populate_cluster_info(info->cluster_info);
> > > > > +	if (ret < 0) {
> > > > > +		dev_err_probe(&sdev->dev, ret, "failed to populate cluster info\n");
> > > > > +		goto err;
> > > > > +	}
> > > > > +
> > > > > +	of_node_get(sdev->dev.of_node);
> > > > > +	do {
> > > > > +		snprintf(name, sizeof(name), "memory-%d", info->memory_cnt);
> > > > > +		struct device_node *memory_np __free(device_node) =
> > > > > +			of_find_node_by_name(sdev->dev.of_node, name);
> > > > > +
> > > > > +		if (!memory_np)
> > > > > +			break;
> > > > > +
> > > > > +		if (info->memory_cnt >= MAX_MEMORY_TYPES)
> > > > > +			return dev_err_probe(&sdev->dev, -EINVAL,
> > > > > +					     "failed to parse unsupported memory type\n");
> > > > > +
> > > > > +		memory = devm_kzalloc(&sdev->dev, sizeof(*memory), GFP_KERNEL);
> > > > > +		if (!memory) {
> > > > > +			ret = -ENOMEM;
> > > > > +			goto err;
> > > > > +		}
> > > > > +
> > > > > +		ret = of_property_read_u32(memory_np, "qcom,memory-type", &memory->hw_type);
> > > > > +		if (ret) {
> > > > > +			dev_err_probe(&sdev->dev, ret, "failed to read memory type\n");
> > > > > +			goto err;
> > > > > +		}
> > > > > +
> > > > > +		ret = of_property_read_u64_array(memory_np, "freq-table-hz", memfreq, 2);
> > > > > +		if (ret && (ret != -EINVAL)) {
> > > > > +			dev_err_probe(&sdev->dev, ret, "failed to read min/max freq\n");
> > > > > +			goto err;
> > > > > +		}
> > > > 
> > > > Can we get this information from the OPP table instead?
> > > 
> > > we don't list all the available ddr/llcc freqs in the opp-table
> > > so that we can keep the table constant across platforms.
> > 
> > NO. Use opp-supported-hw to limit data to a particular platform. There
> > is no reason to keep min/max out of the OPP table.
> 
> if we are movign the opp-tables into driver data for the reasons
> described above, this can probably stay?

No. They duplicate the information that can be a part of the tables. It
doesn't matter if the tables are in the driver or in DT.


-- 
With best wishes
Dmitry


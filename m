Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF42DCA6016
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 21:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNkFP7ef8kESWjXFB8a6H8v6I9TvDNhblU/gkA5sfQw=; b=mRYSNijHPvyry2wQevguDg6qE6
	rQTbgAzPGnomygFf5De8tlAmGwdCsXHp4CLihgQXIdM6OXHycTnKpC0KVO+IZVyjFqkCTlYDkpayK
	OyXFnWob5wJa9XZuiazVUm3Jlo7GT2gN4TOeLLMrzmScX4SfN4A6lt6eJS1OshqDSe7wwSkyo5Sfm
	/5IzlJZo0dppBpExovzk1qZ/NYunvBDpQeDhXr+1uObJYgXixRbrj32pNf9YEckeTMbH5b8yF3ouv
	S+Tv1G2aN2+bPKOo63A5qgZLBP+mN/1FFMiWCihmpu/Bbw5LKjL8wVAfi6qVt+1vf9/czGXJLt32H
	LlszLjRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEvDk-000000053Fu-20Ql;
	Thu, 08 Oct 2026 21:00:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEvDj-000000053Fb-0Arc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 21:00:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B0EA600CB;
	Thu,  8 Oct 2026 21:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945371F00893;
	Thu,  8 Oct 2026 21:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791493205;
	bh=wNkFP7ef8kESWjXFB8a6H8v6I9TvDNhblU/gkA5sfQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eGFVnejgzlFtkHtMAC9R8bNKY8H55YyB8NxBVCFtUM+pizxiUAVPNUOyzg+YoekQ1
	 qo7GVHBOB+I5JkV6TkAozA8cYyBO2efX8ZB6Z7KFNfDoxW/rO5Q+oGVYk+ZxjD4rvS
	 Q5LxxwaDJqTDOJwPjW8RUJCBBDBAlsVq/6kwnOgdXhwm+nFWAiaAzSzNUiwCK1zoRe
	 Ga/cY51CV967MiV7nfm71qvMkA2M14OTBAMJ9x633psEFcWmtaPhxTEcFwEyNTYhKS
	 A7s8449IafPMv0Wh40DfS1EoTE4xot/ci6NlWUpuN9AqKqEZAX5sk5DN/PalunDY2+
	 rqrbZ/gRSKJoA==
Date: Thu, 8 Oct 2026 16:00:04 -0500
From: Rob Herring <robh@kernel.org>
To: Yin Li <yin.li@oss.qualcomm.com>
Cc: James Morse <james.morse@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Drew Fustini <fustini@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
	ganapatrao.kulkarni@oss.qualcomm.com,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
Message-ID: <20261008210004.GA1318789-robh@kernel.org>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
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

On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
> directly under its L2 cache node so that the cache node is the MSC's
> parent device and its CPU affinity is derived from that cache.
> 
> The L2 cache nodes are placed directly under the root node. The root is
> the root of the physical address space, so each cache node only needs an
> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
> a physical address. The two caches use distinct node names (l2-cache-0
> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
> 
> The nodes are disabled by default. Production firmware does not expose
> MSC register access to the OS, so these nodes can only be enabled on a
> local test setup where firmware permits direct MMIO access to the MSCs.
> This DTS is therefore only an example for other platform DT authors and
> is not intended to be merged.
> 
> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>  1 file changed, 38 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 131fd2a16c54..b1dcb1e9c570 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -48,12 +48,6 @@ cpu0: cpu@0 {
>  			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
>  			power-domain-names = "psci", "perf";
>  			#cooling-cells = <2>;
> -
> -			l2_0: l2-cache {
> -				compatible = "cache";
> -				cache-level = <2>;
> -				cache-unified;
> -			};
>  		};
>  
>  		cpu1: cpu@100 {
> @@ -120,12 +114,6 @@ cpu6: cpu@10000 {
>  			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
>  			power-domain-names = "psci", "perf";
>  			#cooling-cells = <2>;
> -
> -			l2_1: l2-cache {
> -				compatible = "cache";
> -				cache-level = <2>;
> -				cache-unified;
> -			};
>  		};
>  
>  		cpu7: cpu@10100 {
> @@ -531,6 +519,44 @@ soccp_smp2p_in: slave-kernel {
>  		};
>  	};
>  
> +	l2_0: l2-cache-0 {

cache@19870000

> +		compatible = "cache";

You need a specific compatible here for your implementation.

> +		cache-level = <2>;
> +		cache-unified;
> +		cache-size = <0xc00000>;
> +		ranges;

Are there any other registers for the cache other than the MSC? If not, 
then:

ranges = <0x0 0x19870000 0x10000>;

If there are, you need 'reg' here.

> +
> +		#address-cells = <2>;
> +		#size-cells = <2>;

You don't need 64 bits of address and size here.

> +
> +		msc@19870000 {
> +			compatible = "arm,mpam-msc";
> +			reg = <0x0 0x19870000 0x0 0x10000>;

The MPAM register length is 0x321C.

Rob


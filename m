Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7A4E98DE6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 15:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQN6ZUdZ5erQ+SaInNOddsQxyH6uHy7XfKgfFoo7sKc=; b=swYwtukRl0AiGhTymq79NHfyaj
	wocKMR05RMvecoFDUBIB5p5SsQjI2mH+cZns93L6GnPtNYVYs/UIjTDQOZJpqPtKaS06V/toxUt4A
	Xmkt7/o/ez2ShCbB1U9gf3Guq9ITKIHVexB5gP3WmdO/6LoneFTUXTEPR/ifHf1IGOwuKvHVv6sK4
	J4eo9EI1pbFVk9z90y/CPhF41y7xHkgQnAhdPmIDl8OmIAm/u4w/66URXn5PrvWUPqtK1XXNfxrwN
	oAXAYejvkEecIhpCgJEQOW3UZZZTJhCQF4MfMRIh6orgCVStd/JR3t32se8hGHzDx1RRpaei884kO
	88AW77Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuY4b-00000000b6G-0jWL;
	Mon, 23 Feb 2026 15:42:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuY4a-00000000b5y-2QLD;
	Mon, 23 Feb 2026 15:42:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D50460054;
	Mon, 23 Feb 2026 15:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CECC116C6;
	Mon, 23 Feb 2026 15:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771861331;
	bh=yurSs7VYMIRx+Jmbg9pFFMOien12/FbdH7HI65YtUAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4XEVoLjwgsQ7ovKA7xtbUTIVcHWVCyV6pn7LOJ292tti18smMR8wnG77SxgalbDg
	 RfgNRI6zvKs/8cXZyOMCiLBb0YqaZH9xuRDx2MY4NeupnNbZFjJqhMaJ8YeAvg7B5v
	 VBYPz9rOAI/WFv0qLsSJzaRmANj4Tm0r0GykuOYk2PjjD3h+49jCkt2p5FSw0rNbk5
	 z3KuS76ScNLrjShfi32YBoHfRV9eG09CMT3drMUaizPybn/yJnzaV8C4ege2Vjb7v4
	 wPmK9fQ3opNtBptr+RX6VE2r07joRxsro9c4TFt4tqOEhoN/+cg4n1U/D5sWlOyEsE
	 hV1PcbRbJs2aw==
Date: Mon, 23 Feb 2026 05:42:10 -1000
From: Tejun Heo <tj@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Tobias Schrammm <t.schramm@manjaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH 1/9] workqueue: devres: Add device-managed allocate
 workqueue
Message-ID: <aZx1UpYSNmapYBpU@slm.duckdns.org>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
 <20260223-workqueue-devm-v1-1-10b3a6087586@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-workqueue-devm-v1-1-10b3a6087586@oss.qualcomm.com>
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

Hello,

On Mon, Feb 23, 2026 at 08:27:29AM +0100, Krzysztof Kozlowski wrote:
> @@ -568,19 +588,31 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
>   */
>  #define alloc_ordered_workqueue(fmt, flags, args...)			\
>  	alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, ##args)
> +#define devm_alloc_ordered_workqueue(dev, fmt, flags, args...)		\
> +	devm_alloc_workqueue(dev, fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, ##args)

Let's just add devm_alloc_workqueue() and devm_alloc_ordered_workqueue() and
skip the legacy wrappers.

Thanks.

-- 
tejun


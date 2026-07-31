Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D905C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 03:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExYIItcDEZWrDnj18MKrsQX+GnPewakLGGldn9zFVCQ=; b=MyxgVRdptHNprvzEFi907m28CQ
	x1X65vhEMOJtoHc7iJdl5l8myW9XkoOEm3KiH8PInybP1Ievs3VMDpN/EPWxiDmuExdTUJv98Fdo7
	RZU09fnnOVzhCHcUtlGRdU6Ck/kXoe+M/YJ4Tvg4nttoZpmtnAYi0PLaIYxUX4Xf4f6t6JLEa0vAX
	jZKwGk12NJUYSWkipl/3pmHm7QZCT2uD1xzKYYAZRV6D9tmyBbhbC/HKFsKkxQ4KOt17CxuehHpHs
	TgT89qG367TudxU/Zvu2KCvZ135etX3z3/6Kd7V3vmCy6o8zGZOuMbwHmQOii3AduEEQ8uW5ynsKJ
	+1UIMX0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpdqq-0000000BgNF-1aBb;
	Fri, 31 Jul 2026 03:24:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpdqn-0000000BgN0-2P38;
	Fri, 31 Jul 2026 03:23:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DFD1D4401E;
	Fri, 31 Jul 2026 03:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4FA1F00A3D;
	Fri, 31 Jul 2026 03:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468236;
	bh=ExYIItcDEZWrDnj18MKrsQX+GnPewakLGGldn9zFVCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=alJPz710ds45M32sC/W4EDR1+q0unwltstCOWbnGaG6ro0iMcmbnQtoip8c8VaS9x
	 ucunAffa0RGqITe9ralEA5C8L9d13xx3fChUikErBa6niEP8a0BFzEcB05S35Q/1/2
	 1UFyndof2hw2Kau7xmVNSRKQRuzNuN582osWVF/C+PDDv2GUXij6aDfXH6eui0f3D7
	 cL6fOvwE4GtNUfPpna/rRL5r3qKYZUh8Ra7Ca74SqJd80LQ9HhpE4EvImKKPLv7m1r
	 fH9bifgptxWsZVifHaG6cyE2ohO49GEnwg7hJeZoduwMm3zEAx/5fx/2COa05v/hg8
	 b48DbmwT4DuTg==
From: Bjorn Andersson <andersson@kernel.org>
To: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	coresight@lists.linaro.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 0/3] Retrieve information about DDR from SMEM
Date: Thu, 30 Jul 2026 22:23:43 -0500
Message-ID: <178546821257.316167.5256445385425936604.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727-topic-smem_dramc-v5-0-66188b3e338d@oss.qualcomm.com>
References: <20260727-topic-smem_dramc-v5-0-66188b3e338d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Mon, 27 Jul 2026 11:59:26 +0200, Konrad Dybcio wrote:
> SMEM allows the OS to retrieve information about the DDR memory.
> Among that information, is a semi-magic value called 'HBB', or Highest
> Bank address Bit, which multimedia drivers (for hardware like Adreno
> and MDSS) must retrieve in order to program the IP blocks correctly.
> 
> This series introduces an API to retrieve that value, uses it in the
> aforementioned programming sequences and exposes available DDR
> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> information can be exposed in the future, as needed.
> 
> [...]

Applied, thanks!

[1/3] soc: qcom: smem: Use 'unsigned int' instead of 'unsigned'
      commit: 80350cdc5f7e2ddc6739987a78f04b9b7788e593
[2/3] soc: qcom: smem: Expose DDR data from SMEM
      commit: 1d234eeafc56af8c9af6eee857f41a4310615e78
[3/3] soc: qcom: ubwc: Get HBB from SMEM
      commit: 1b445022d1d0ec7431b6f8fe0054ae8ccf33d60a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


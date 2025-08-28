Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7A9CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7CBo4RsO1OtHtmHnfgVDg7Mz0lcVGOkV5Of38is0x70=; b=UTsL3pdZrEE5LU
	PUqf6fX1EgoAU4XXv+TrTET5+RKTUgDpwF/a6Pdn1BR/TpvSYucvRJHn6sIB3gFF16EN8XOk9q3lv
	4AW31sE9wdfJ5D7mXwhQ2/A9C2Eo76Wf07W0qFcTgDdhMaUfQUCw+h4G1UHqPmEANnLv3uPZMWj7H
	xzRLZsAHUF3nbojl/loPzxwxKHisH42Hba47n4eNmr79sWbSgeHhrn70jKIlOJ6wHFcOSJ+wKdN5v
	J0hJYpKtyC1RK9gxbE3vBuGCio4kTOEaYcA2YoihJQ2+xstLgyhCuVXXRdKBYvX57EoioqpYFPH2M
	qhZ4xZr4/kXO8dLuRnYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgLp-00000002QEG-2QoN;
	Thu, 28 Aug 2025 17:23:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbSA-00000001SrE-2wKI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:10:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5rOPH014879
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7CBo4RsO1OtHtmHnfgVDg7
	Mz0lcVGOkV5Of38is0x70=; b=QJFt/4dvLk01+Sf1U4efBMYxrqr7DQxobVw5k3
	ePY6CVc2X3id7Ln5cclpNqtwiJbrfd2/oYbBR3IrixxAwdR0R9MhkCB+TmZJLq0h
	/hWQjrXgKTj7w2HKTPXRmJbTtdVzPa/T2p+piBCchm0x5ZnUJyVxqX57AlfZo2mV
	CSxKv57khcgatU8d0vjwpt4oxMC/O5cSjExXiqOU73iXTOSwSQNTHCBaB/h1AjYo
	4O+0JzGjtnC4rDXfYb5/XR5cYftPjuFgS22ObH/LqfO9eJOz65TDrWXqBYVSlLSc
	L9kdVyN4Ev+e/0pOycUyBm8HlvgIKeglJIiOzWk1ge6H1CTw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we7uha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:10:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-327642d9c82so1036412a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383003; x=1756987803;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7CBo4RsO1OtHtmHnfgVDg7Mz0lcVGOkV5Of38is0x70=;
        b=GZq6DhmyMYfG8kfnsbFvMQBJfK2Ij6E3+HswzU9kxZPh5XleRjrqjFq/bzoo9eJIPo
         hmumoDqJUqE7UNsrXAW9PqN9lcZSdTEgCC6uS+LIXCqhMejyu8UltZn3l2QoMJkNI6PU
         yj41iEP6XKUqEnS7cixldGQcvNTddSxZ4qMJQU9ToeyKteIq91WDzBvoa7IhdpaydIeY
         wRZN0XgPZz0BhNVjZCR+cIH775YjpQYk3OthAivter6Be+pbKqe14Fwr3DmMFTOgwcyo
         XycBLrvfO4/BHN7CysIoQ28baRg7Z5E73m9wkLI+AITeEz+5uv5UdHR5W9FpwQFmdE0V
         RZmA==
X-Forwarded-Encrypted: i=1; AJvYcCXDBAon/MsNlbVe5C33MqVaSKGVbCzPpccCwOPxJMWjVawpRMDS66ors8f0/sQrX+SFRWk+FLwe81l1h+p5pXVG@lists.infradead.org
X-Gm-Message-State: AOJu0YzrQ7KPUzNJT6s+u9NsTOfc275GhFbOl6kgRt/NMwzSl6ZyU/3M
	SFyNGAHTLz7TF07x8bcF4Ju3m79iC5jEMhm95cWDztEHsUU7fIL4Pa+Fc96Y7spTyELLFgMQG4M
	6Kod48D0nNW3F0sAN79/JXp8EJ4OqlXUwyv/RUW8R5qxE8D0AOsYwzdZZFffcuzkR4mUexVRcXK
	xVRg==
X-Gm-Gg: ASbGncsDWYRZBLhO0zKCYxvOjsZpaIuIB8xysz0wEJncYAwBPtYYviw9mYS+KjgUX2r
	qR5Nf2m3yRqKABCuJGpjZQJoTceSainS3LcAPAkDHb5rctu6BX6a63To1bcNEqjXJUvyJf/CgFX
	kyHpjQDrKv4dJiyPkUID6eNvgqfoCyd2jGuvJkAn2yW0QUNz1QwloCdSbMT5FnhohQPiKCHx8iU
	BkSlS84XUlaOBGVaX12eyr8g3peoVP3LVp806VBsjDWcyGXelPXGLS/CZlRMWUZ6hIXDS+wSqQD
	kHJQ3lWPo2tNF63fK78WvBNYHivfebiq0cVszZfxuKO6Td1/FNQZq7wk/E77rIqhIBAwbSQSd/A
	=
X-Received: by 2002:a17:90b:3e89:b0:327:aaeb:e80d with SMTP id 98e67ed59e1d1-327aaebeff2mr3337432a91.7.1756383002722;
        Thu, 28 Aug 2025 05:10:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGShFwQdg1pXVH6TjbXej5/b8b+Ns3k7qKTLxyF2H8wNDEb5AkmNYw+GftmViK1wKFDqMPXpw==
X-Received: by 2002:a17:90b:3e89:b0:327:aaeb:e80d with SMTP id 98e67ed59e1d1-327aaebeff2mr3337372a91.7.1756383002079;
        Thu, 28 Aug 2025 05:10:02 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32741503367sm4019070a91.0.2025.08.28.05.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:10:01 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v6 0/9] PCI: Enable Power and configure the TC9563 PCIe
 switch
Date: Thu, 28 Aug 2025 17:38:57 +0530
Message-Id: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANpGsGgC/22P0QqCMBSGXyV23WQ7umld9R4RMvUsB+nU1SjEd
 28aEWU3B/4D33fOPxKHg0FH9puRDOiNM7YNQW43pKxVe0ZqqpAJMBAMONC+c5KL3Cc5pzpDCVp
 xnmaSBKIbUJv7YjueQq6Nu9rhsch9Mm/fHvnl8QlllKcIVSV2UIA6WOei/qYupW2aKIzZ/kJBr
 FFkmYxjlRaVztbo/IkXn+vJTwsvgkIUUjHJY9BY/lFM0/QErI8IJysBAAA=
X-Change-ID: 20250212-qps615_v4_1-f8e62fa11786
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shawn Anastasio <sanastasio@raptorengineering.com>,
        Timothy Pearson <tpearson@raptorengineering.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756382994; l=8072;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=fmCVWwvsFOC0IPTia4wk7audEaDOpQ5OD/rFcq2x+T8=;
 b=dntgyrpafu+Mj5IVIc77CSF3hlcMUe2yGSqQ48lTbPzSV6qF9wgaXfinZ370jrXGNl5oSiuZf
 peN02jJk2InDqtRom7uM9LZvHNA4KsH8wmspIc3xbAhCu4eTnsbZZxu
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: OKRoT_djYuv3Fl1bqgRMFXRQl7w2pWD3
X-Proofpoint-ORIG-GUID: OKRoT_djYuv3Fl1bqgRMFXRQl7w2pWD3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX5BQNC2hn6x6S
 6kq2HF+HhGpbeYUe476x9Z5a/ykhN3anb79dTqTgKxWhYJjMcrkQtABgTwHI+0DQTnlQzBwMJKC
 yz8+1zvOy8ps9S2HruRft7AAttl9bzeuw0bhxpqembw5XDDUDVQAfdT048je9zdwKRER5yBwuOF
 +0bWqmMVjNVzApD93Aa2wcOYQ2BHpsBTs0hYGU3iPcRVc7f+oaNmb8CuBWgWTLw1FkEfwi6udC7
 Qb65Ng//T6IjcUjB4HLNZiDe4O57ITP14NbamVJbsXJZU1aePyVx5/aj+UKhqaCGFRzdV1SlyA2
 d17CiJx9n2jLlQKR1iKcs+pAwpMEms4I5FMtSu9N5oA3HPmPMjH0PO6IgfZmSk+S4uDnxAryRwm
 T2eDEg4L
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b0471c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yKAn6K1XAAAA:8 a=COk6AnOGAAAA:8 a=jdgvuftHn8Q9ZZcfGlkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=6M1ixcW_PCWoKiWyFx5v:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_051006_874447_27C29F99 
X-CRM114-Status: GOOD (  27.98  )
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

TC9563 is the PCIe switch which has one upstream and three downstream
ports. To one of the downstream ports ethernet MAC is connected as endpoint
device. Other two downstream ports are supposed to connect to external
device. One Host can connect to TC956x by upstream port.

TC9563 switch power is controlled by the GPIO's. After powering on
the switch will immediately participate in the link training. if the
host is also ready by that time PCIe link will established. 

The TC9563 needs to configured certain parameters like de-emphasis,
disable unused port etc before link is established.

As the controller starts link training before the probe of pwrctl driver,
the PCIe link may come up as soon as we power on the switch. Due to this
configuring the switch itself through i2c will not have any effect as
this configuration needs to done before link training. To avoid this
introduce two functions in pci_ops to start_link() & stop_link() which
will disable the link training if the PCIe link is not up yet.

This series depends on the https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/

Note: The QPS615 PCIe switch is rebranded version of Toshiba switch TC9563 series.
There is no difference between both the switches, both has two open downstream ports
and one embedded downstream port to which Ethernet MAC is connected. As QPS615 is the
rebranded version of Toshiba switch rename qps615 with tc956x so that this driver
can be leveraged by all who are using Toshiba switch.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v6:
- Took v10 patch  https://lore.kernel.org/all/1822371399.1670864.1756212520886.JavaMail.zimbra@raptorengineeringinc.com/
  to my series as my change is dependent on it.
- Add Reviewed-by tag by Rob on dt-binding patch.
- Add Reviewed-by tag by Dmitry on devicetree.
- Fixed compilation errors.
- Fixed n-fts issue point by (Bjorn Helgaas).
- Fixed couple of nits by (Bjorn Helgas).
- Link to v5: https://lore.kernel.org/r/20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com
Changes from v4:
- Rename tc956x to tc9563, instead of using x which represents overlay board one
  use actual name (Konrad & Krzysztof).
- Remove the patches 9 & 10 from the series and this will be added by mani
- Couple of nits by Konrad
- Have defconfig change for TC956X by Dmitry
- Change the function name pcie_is_link_active to pcie_link_is_active
  replace all call sites of pciehp_check_link_active() with a call
  to the new function. return bool instead of int (Lukas)
- Add pincntrl property for reset gpio (Dmitry)
- Follow the example-schema order, remove ref for the
  tx-amplitude-microvolt, change the vendor prefix (Krzysztof)
- for USP node refer pci-bus-common.yaml and for remaining refer
  pci-pci-bridge.yaml(Mani)
- rebase to latest code and change pci dev retrieval logic due code
  changes in the latest tip.
- Link to v4: https://lore.kernel.org/r/20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com
changes from v3:
- move common properties like l0s-delay, l1-delay and nfts to pci-host-common.yaml (bjorn H)
- remove axi-clk-frequency property (Krzysztof)
- Update the pattern properties (Rob)
- use pci-pci-bridge as the reference (Rob)
- change tx-amplitude-millivolt to tx-amplitude-microvolt  (Krzysztof)
- rename qps615_pwrctl_power_on to qps615_pwrctl_bring_up (Bart)
- move the checks for l0s_delay, l1_delay etc to helper functon to
  reduce a level of indentation (Bjorn H)
- move platform_set_drvdata to end after there is no error return (bjorn H)
- Replace GPIOD_ASIS to GPIOD_OUT_HIGH (Mani)
- Create a common api to check if link is up or not and use that to call
  stop_link() and start_link().
- couple of nits in comments, names etc from everyone
Link to v3: https://lore.kernel.org/all/20241112-qps615_pwr-v3-3-29a1e98aa2b0@quicinc.com/T/
Changes from v2:
- As per offline discussions with rob i2c-parent is best suitable to
  use i2c client device. So use i2c-parent as suggested and remove i2c
  client node reference from the dt-bindings & devicetree.
- Remove "PCI: Change the parent to correctly represent pcie hierarchy"
  as this requires seperate discussions.
- Remove bdf logic to identify the dsp's and usp's to make it generic
  by using the logic that downstream devices will always child of
  upstream node and dsp1, dsp2 will always in same order (Dmitry)
- Remove recursive function for parsing devicetree instead parse
  only for required devicetree nodes (Dmitry)
- Fix the issue in be & le conversion (Dmitry).
- Call put_device for i2c device once done with the usage (Dmitry)
- Use $defs to describe common properties between upstream port and
  downstream properties. and remove unneccessary if then. (Krzysztof)
- Place the qcom,qps615 compatibility in dt-binding document in alphabatic order (Krzysztof)
- Rename qcom,no-dfe to describe it as hardware capability and change
  qcom,nfts description to reflect hardware details (Krzysztof)
- Fix the indentation in the example in dt binding (Dmitry)
- Add more description to qcom,nfts (Dmitry)
- Remove nanosec from the property description (Dmitry)
- Link to v2: https://lore.kernel.org/r/linux-arm-msm/20240803-qps615-v2-0-9560b7c71369@quicinc.com/T/
Changes from v1:
- Instead of referencing whole i2c-bus add i2c-client node and reference it (Dmitry)
- Change the regulator's as per the schematics as per offline review
(Bjorn Andresson)
- Remove additional host check in bus.c (Bart)
- For stop_link op change return type from int to void (Bart)
- Remove firmware based approach for configuring sequence as suggested
by multiple reviewers.
- Introduce new dt-properties for the switch to configure the switch
as we are replacing the firmware based approach.
- The downstream ports add properties in the child nodes which will
represented in PCIe hierarchy format.
- Removed D3cold D0 sequence in suspend resume for now as it needs
separate discussion.
- Link to v1: https://lore.kernel.org/linux-pci/20240626-qps615-v1-4-2ade7bd91e02@quicinc.com/T/

---
Krishna Chaitanya Chundru (9):
      dt-bindings: PCI: Add binding for Toshiba TC9563 PCIe switch
      arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe switch node
      PCI: Add new start_link() & stop_link function ops
      PCI: dwc: Add host_start_link() & host_start_link() hooks for dwc glue drivers
      PCI: dwc: Implement .start_link(), .stop_link() hooks
      PCI: qcom: Add support for host_stop_link() & host_start_link()
      PCI: Add pcie_link_is_active() to determine if the link is active
      PCI: pwrctrl: Add power control driver for tc9563
      arm64: defconfig: Enable TC9563 PWRCTL driver

 .../devicetree/bindings/pci/toshiba,tc9563.yaml    | 178 ++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       | 128 +++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/pci/controller/dwc/pcie-designware-host.c  |  18 +
 drivers/pci/controller/dwc/pcie-designware.h       |  16 +
 drivers/pci/controller/dwc/pcie-qcom.c             |  35 ++
 drivers/pci/hotplug/pciehp.h                       |   1 -
 drivers/pci/hotplug/pciehp_ctrl.c                  |   2 +-
 drivers/pci/hotplug/pciehp_hpc.c                   |  35 +-
 drivers/pci/pci.c                                  |  28 +-
 drivers/pci/pci.h                                  |   1 +
 drivers/pci/pwrctrl/Kconfig                        |  13 +
 drivers/pci/pwrctrl/Makefile                       |   2 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 637 +++++++++++++++++++++
 include/linux/pci.h                                |   2 +
 16 files changed, 1062 insertions(+), 37 deletions(-)
---
base-commit: 07d9df80082b8d1f37e05658371b087cb6738770
change-id: 20250212-qps615_v4_1-f8e62fa11786

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


